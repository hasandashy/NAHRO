using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NAHRO.Domain
{
    public class Employee
    {
        public int Id { get; set; }
        public string EmpId { get; set; }
        public string Prefix { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public string Suffix { get; set; }        
        public string JobTitle { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public int AgencyId { get; set; }
        public string MembershipType { get; set; }
        public bool IsMember { get; set; }
        public DateTime MembershipStartDate { get; set; }
        public DateTime MembershipEndDateDate { get; set; }
        public bool IsDeleted { get; set; }
    }
}
