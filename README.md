# Acme Investments

## Major Components
This project consists of two major components:
1. A .NET Console application that contains some simple data contracts that represent employees and an aggregator class for calculating budgets.
2. A SQL Server database project for stock holdings of the Acme Company.

## Tests
There are two flavors of tests to verify the C# and SQL code operate as expected:
1. [BudgetAggregatorTest.cs](https://github.com/nickhepp/AcmeInvestments/blob/trunk/AcmeInvestments/AcmeInvestmentsTest/Business/BudgetAggregatorTest.cs) - unit tests for the C# code
Here is a test snippet
```C#
[TestMethod]
public void GetBudget_Level2Manager2_SalaryReturned()
{
    // arrange
    // level1Manager1 --> !!!level2Manager2!!! --> !!!level3Employee4!!!
    //                \-> level2Employee3

    // act
    double actualBudget = _agg.GetBudget(level2Manager2);

    // assert
    Assert.AreEqual(expected: level3Employee4Salary + level2Manager2Salary, actualBudget, "The budget of the level 2 manager was not correct.");
}
```

2. [TestData1.sql](https://github.com/nickhepp/AcmeInvestments/blob/trunk/AcmeInvestments/AcmeInvestmentsDB/Stock/Tests/TestData1.sql) - SQL tests
Here is a test snippet
```sql
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
```

## Environment
This solution was created with VS2022.  