using AcmeInvestments.DataContracts;

namespace AcmeInvestments.Business
{
    public class BudgetAggregator
    {
        public double GetBudget(Employee employee)
        {
            if (employee is IHasReports hasReports)
            {
                // recurse if this employee has reports
                return GetBudgetWithReports(hasReports);
            }
            else
            {
                return employee.Salary;
            }
        }

        private double GetBudgetWithReports(IHasReports employeeWithReports)
        {
            double budget = employeeWithReports.Salary;

            foreach (var employee in employeeWithReports.Reports) 
            { 
                if (employee is IHasReports hasReports)
                {
                    // recurse if this employee has reports
                    budget += GetBudgetWithReports(hasReports);
                }
                else
                {
                    // just this employee, add it up
                    budget += employee.Salary;
                }
            }
            return budget;
        }

    }
}
