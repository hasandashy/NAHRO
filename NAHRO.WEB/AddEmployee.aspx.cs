using NAHRO.Domain;
using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB
{
    public partial class AddEmpoyee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string queryString = Request.QueryString["action"] ?? string.Empty;
            //if(queryString.Length == 0)
            //{
                var uc = (UserControl)Page.LoadControl("~/Controls/ctrlCheckEmployee.ascx");
                pnlEmp.Controls.Add(uc);
            //}
            //if (queryString == "edit")
            //{
            //    var uc = (UserControl)Page.LoadControl("~/Controls/ctrlEmployeeEdit.ascx");
            //    pnlEmp.Controls.Add(uc);
            //}
        }

        [WebMethod]
        public static bool CheckEmail(string email)
        {
            EmployeeServices employee = new EmployeeServices();
            return employee.CheckEmail(email);
        }

        [WebMethod(EnableSession =true)]
        public static void AddEmployee(string email, string prefix, string fname, string mname, string lname,string nickName, string suffix, int agencyId, string phone, string fax, string jobTitle,DateTime membershipStartDate, string emailLocation)
        {
            Employee employee = new Employee()
            {
                Email = email,
                Prefix = prefix,
                FirstName = fname,
                LastName = lname,
                MiddleName = mname,
                NickName = nickName,
                Suffix = suffix,
                AgencyId = agencyId,
                Phone = phone,
                Fax = fax,
                JobTitle = jobTitle,
                MembershipStartDate = membershipStartDate
            };

            EmployeeServices employeeService = new EmployeeServices();
            employeeService.AddEmployee(employee);
            HttpContext.Current.Session["empAdded"] = "1";
        }

        [WebMethod]
        public static bool CheckName(string firstname, string lastname)
        {
            EmployeeServices employee = new EmployeeServices();
            return employee.CheckEmployeeByName(firstname,lastname);
        }


    }
}