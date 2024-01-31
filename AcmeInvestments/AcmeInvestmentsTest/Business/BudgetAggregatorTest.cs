using AcmeInvestments;
using AcmeInvestments.Business;

namespace AcmeInvestmentsTest.Business
{
    [TestClass]
    public class BudgetAggregatorTest
    {

        // Initialize all the data that will be used for the tests.
        // There are 3 levels of employees: level 1 (top), level 2 (middle),
        // and level 3 (bottom).  We will write tests for all 3 levels of employees.
        // This directed graph represents their relationship:
        // level1Manager1 --> level2Manager2 --> level3Employee4
        //                \-> level2Employee3


        // Create some fake users -- level 3
        public const double level3Employee4Salary = 200000; // 200k
        private Manager level3Employee4;

        // Create some fake users -- level 2
        public const double level2Manager2Salary = 500000; // 500k
        private Manager level2Manager2;

        public const double level2Employee3Salary = 300000; // 300k
        private Manager level2Employee3;


        // Create some fake users -- level 1
        public const double level1Manager1Salary = 1000000; // 1 million
        private Manager level1Manager1;


        private BudgetAggregator _agg;
        [TestInitialize]
        public void Initialize()
        {
            level3Employee4 = new Manager
            {
                EmployeeID = 4,
                Salary = level3Employee4Salary
            };

            level2Manager2 = new Manager
            {
                EmployeeID = 2,
                Salary = level2Manager2Salary,
                Reports = new List<Employee> { level3Employee4 }
            };

            level2Employee3 = new Manager
            {
                EmployeeID = 3,
                Salary = level2Employee3Salary
            };

            level1Manager1 = new Manager
            {
                EmployeeID = 1,
                Salary = level1Manager1Salary,
                Reports= new List<Employee> { level2Manager2, level2Employee3 }
            };

            _agg = new BudgetAggregator(); // include mocked dependencies here if there are any
        }


        // use 3 part naming: method under test, context, expected result

        [TestMethod]
        public void GetBudget_Level3Employee4_SalaryReturned()
        {
            // arrange
            // level1Manager1 --> level2Manager2 --> !!!level3Employee4!!!
            //                \-> level2Employee3

            // act
            double actualBudget = _agg.GetBudget(level3Employee4);

            // assert
            Assert.AreEqual(expected: level3Employee4Salary, actualBudget, "The budget of the level 3 employee was not correct.");
        }

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

        [TestMethod]
        public void GetBudget_Level1Manager1_SalaryReturned()
        {
            // arrange
            // !!!level1Manager1!!! --> !!!level2Manager2!!! --> !!!level3Employee4!!!
            //                      \-> !!!level2Employee3!!!

            // act
            double actualBudget = _agg.GetBudget(level1Manager1);

            // assert
            Assert.AreEqual(expected: level3Employee4Salary + level2Manager2Salary + level2Employee3Salary + level1Manager1Salary, actualBudget, "The budget of the level 1 manager was not correct.");
        }

    }
}