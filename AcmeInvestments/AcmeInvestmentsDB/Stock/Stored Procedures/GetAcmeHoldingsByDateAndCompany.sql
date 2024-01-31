CREATE PROCEDURE [Stock].[GetAcmeHoldingsByDateAndCompany]
	@StockTickerSymbol VARCHAR(4),
	@Date DATE
AS

	SELECT
		CASE
			WHEN SUM([INNER_QRY].[Quantity] * [INNER_QRY].[Price]) IS NULL THEN 0.0
			ELSE SUM([INNER_QRY].[Quantity] * [INNER_QRY].[Price])
		END AS [TotalAcmeHoldings]
	FROM (
		SELECT 
			[Holding].[Quantity], [StockPrice].[Price]
		FROM [Stock].[Company] AS [Company]
		-- limit to the company stock
		INNER JOIN [Stock].[Stock] AS [Stock]
			ON [Company].[StockTickerSymbol] = @StockTickerSymbol  
				AND [Company].[CompanyID] = [Stock].[CompanyID]
		-- limit to stock prices for that day
		INNER JOIN [Stock].[StockPrice] AS [StockPrice]
			ON [StockPrice].[StockID] = [Stock].[StockID]
				AND [StockPrice].[StockDate] = @Date
		-- limit to to the holdings of Acme
		INNER JOIN [Stock].[AcmeHolding] AS [Holding]
			ON [Holding].[StockID] = [StockPrice].[StockID]
				AND [Holding].[StockDate] = [StockPrice].[StockDate]
		GROUP BY [Holding].[Quantity], [StockPrice].[Price]
	) INNER_QRY

RETURN 0
