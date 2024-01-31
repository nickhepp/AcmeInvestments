# Acme Investments

## Major Components
This project consists of two major components:
1. A .NET Console application that contains some simple data contracts that represent employees and an aggregator class for calculating budgets.
2. A SQL Server database project for stock holdings of the Acme Company.

## Tests
There are two flavors of tests to verify the C# and SQL code operate as expected:
1. [BudgetAggregatorTest.cs](.\AcmeInvestments\AcmeInvestmentsTest\Business\BudgetAggregatorTest.cs) - unit tests for the C# code
2. [TestData1.sql](.\AcmeInvestments\AcmeInvestmentsDB\Stock\Tests\TestData1.sql) - SQL tests

## Environment
This solution was created with VS2022.  