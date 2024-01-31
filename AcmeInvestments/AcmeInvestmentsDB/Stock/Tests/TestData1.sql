-- Create test data for Company table
INSERT INTO [Stock].[Company] (CompanyID, StockTickerSymbol)
VALUES 
    (1, 'GOOG'), -- Google
    (2, 'AMZN'),  -- Amazon
    (3, 'AAPL');  -- Apple

-- Create test data for Stock table
INSERT INTO [Stock].[Stock] (StockID, CompanyID)
VALUES 
    (101, 1), -- Google Stock 1
    (102, 1), -- Google Stock 2
    (201, 2), -- Amazon Stock 1
    (202, 2), -- Amazon Stock 2
    (301, 3), -- Apple Stock 1
    (302, 3); -- Apple Stock 2

-- Create test data for StockPrice table
INSERT INTO [Stock].[StockPrice] (StockID, StockDate, Price)
VALUES
    (101, '2024-01-01', 15.00),
    (101, '2024-01-02', 16.00),     -- Test1 includes this row
    (101, '2024-01-03', 17.00),
    (102, '2024-01-01', 18.00),
    (102, '2024-01-02', 19.00),     -- Test1 includes this row
    (102, '2024-01-03', 20.00),
    (201, '2024-01-01', 3200.00),
    (201, '2024-01-02', 3180.00),
    (201, '2024-01-03', 3220.00),
    (202, '2024-01-01', 3300.00),
    (202, '2024-01-02', 3350.00),
    (202, '2024-01-03', 3400.00),
    (301, '2024-01-01', 1.70),
    (301, '2024-01-02', 1.75),
    (301, '2024-01-03', 1.80),      -- Test2 includes this row
    (302, '2024-01-01', 1.85),
    (302, '2024-01-02', 1.90),
    (302, '2024-01-03', 1.95);      -- Test2 includes this row

-- Create test data for AcmeHolding table
INSERT INTO [Stock].[AcmeHolding] (StockID, StockDate, Quantity)
VALUES
    (101, '2024-01-01', 5),
    (101, '2024-01-02', 8),     -- Test1 includes this row
    (101, '2024-01-03', 10),
    (102, '2024-01-01', 2),
    (102, '2024-01-02', 3),     -- Test1 includes this row
    (102, '2024-01-03', 4),
    -- no Amazon stock held     -- Test3 will have 0 results
    (301, '2024-01-01', 20),
    (301, '2024-01-02', 22),
    (301, '2024-01-03', 25),    -- Test2 includes this row
    (302, '2024-01-01', 18),
    (302, '2024-01-02', 20),
    (302, '2024-01-03', 22);    -- Test2 includes this row

-- =========== Test1
DECLARE @StockTickerSymbolTest VARCHAR(4) = 'GOOG';
DECLARE @DateTest DATE = '2024-01-02';

EXEC [Stock].[GetAcmeHoldingsByDateAndCompany] @StockTickerSymbolTest, @DateTest;

-- Test1: expected value = (16.00 * 8) + (19.00 * 3) = 185.0

-- =========== Test2
SET @StockTickerSymbolTest = 'AAPL';
SET @DateTest = '2024-01-03';

EXEC [Stock].[GetAcmeHoldingsByDateAndCompany] @StockTickerSymbolTest, @DateTest;

-- Test2: expected value = (1.80 * 25) + (1.95 * 22) = 87.9

-- =========== Test3
SET @StockTickerSymbolTest = 'AMZN';
SET @DateTest = '2024-01-01';

EXEC [Stock].[GetAcmeHoldingsByDateAndCompany] @StockTickerSymbolTest, @DateTest;

-- Test3: expected value = 0
