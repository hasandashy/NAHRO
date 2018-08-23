using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB.Controls
{
    public partial class ctrlManagers : System.Web.UI.UserControl
    {
        protected int totalManagers =Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["managersAllowed"]);
        protected int managersAssigned = 0;
        protected int managersAvailable = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
             BindData();
        }

        void BindData()
        {
            ManagerServices ascServices = new ManagerServices();
            lstEmployee.DataSource = ascServices.GetAllManagers();
            lstEmployee.DataBind();
            managersAssigned = ascServices.GetManagerCount();
            managersAvailable = totalManagers - managersAssigned;
            HiddenField hf = (HiddenField)Parent.FindControl("hidLastTab");
            hf.Value = "3";
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstEmployee.FindControl("dtPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindData();
        }

        protected void lstEmployee_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ManagerServices ascServices = new ManagerServices();
                ascServices.DeleteManager(id);
                BindData();
            }
        }

        protected void btnD_Click(object sender, EventArgs e)
        {
            string fileName = "Managers.xls";

            AssociateServices employeeServices = new AssociateServices();

            DataGrid dg = new DataGrid
            {
                AllowPaging = false,
                DataSource = employeeServices.GetAllAssociates()
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