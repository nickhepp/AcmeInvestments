using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcmeInvestments.DataContracts
{
    public interface IHasReports : IEmployee
    {
        List<Employee> Reports { get; }

    }
}
