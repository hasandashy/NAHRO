using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NAHRO.Domain
{
   public class GroupManager
    {
        public int Id { get; set; }
        public string EmpId { get; set; }
        public string Name { get; set; }
        public string JobTitle { get; set; }
        public string Email { get; set; }
        public string MembershipType { get; set; }
        public bool IsMember { get; set; }
        public DateTime MembershipStartDate { get; set; }
        public DateTime MembershipEndDateDate { get; set; }
        public bool IsDeleted { get; set; }
    }
}
