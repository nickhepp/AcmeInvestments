CREATE TABLE [Stock].[Company]
(
    CompanyID INT PRIMARY KEY NOT NULL,
    StockTickerSymbol VARCHAR(4) NOT NULL UNIQUE
)
