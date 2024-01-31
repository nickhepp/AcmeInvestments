using AcmeInvestments.DataContracts;

namespace AcmeInvestments
{
    public class Manager : Employee, IHasReports
    {
        public List<Employee> Reports { get; set; } = new List<Employee>();
    }
}
