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
            
                BindData();
        }

        void BindData()
        {
            EmployeeServices employeeServices = new EmployeeServices();
            lstEmployee.DataSource = employeeServices.GetAllEmplyees();
            lstEmployee.DataBind();
            HiddenField hf = (HiddenField)Parent.FindControl("hidLastTab");
            hf.Value = "1";
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

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstEmployee.FindControl("dtPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindData();
        }


        protected void btnD_Click(object sender, EventArgs e)
        {
            string fileName = "Employees.xls";

            EmployeeServices employeeServices = new EmployeeServices();

            DataGrid dg = new DataGrid
            {
                AllowPaging = false,
                DataSource = employeeServices.GetAllEmplyees()
            };
            
            dg.DataBind();

            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.Buffer = true;
            System.Web.HttpContext.Current.Response.ContentEncoding = Encoding.UTF8;
            System.Web.HttpContext.Current.Response.Charset = "";
            System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition",
              "attachment; filename=" + fileName);

            System.Web.HttpContext.Current.Response.ContentType =
              "application/vnd.ms-excel";
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlTextWriter =
              new System.Web.UI.HtmlTextWriter(stringWriter);
            dg.RenderControl(htmlTextWriter);
            System.Web.HttpContext.Current.Response.Write(stringWriter.ToString());
            System.Web.HttpContext.Current.Response.End();


        }
    }
}