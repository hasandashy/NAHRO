using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using NAHRO.DomainServices;

namespace NAHRO.WEB
{
    public partial class ctrlEmplyees : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        void BindData()
        {
            EmployeeServices employeeServices = new EmployeeServices();
            lstEmployee.DataSource = employeeServices.GetAllEmplyees();
            lstEmployee.DataBind();
        }

        protected void lstEmployee_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                EmployeeServices employeeServices = new EmployeeServices();
                employeeServices.DeleteEmployee(id);
                BindData();
            }
        }

     
    }
}