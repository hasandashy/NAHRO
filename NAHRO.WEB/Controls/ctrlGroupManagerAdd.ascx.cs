using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB.Controls
{
    public partial class ctrlGroupManagerAdd : System.Web.UI.UserControl
    {
        protected int totalManagers = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["managersAllowed"]);
        protected int managersAssigned = 0;
        protected int managersAvailable = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        void BindData()
        {
            ManagerServices ascServices = new ManagerServices();
            lstEmployee.DataSource = ascServices.GetNewManagers();
            lstEmployee.DataBind();
            managersAssigned = ascServices.GetManagerCount();
            managersAvailable = totalManagers - managersAssigned;
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstEmployee.FindControl("dtPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindData();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var items = lstEmployee.Items.Where(i => ((CheckBox)i.FindControl("Checkbox")).Checked);
            foreach (ListViewItem item in items)
            {
                HiddenField hid = item.FindControl("HidId") as HiddenField;
                ManagerServices ascServices = new ManagerServices();
                ascServices.AddManager(Convert.ToInt32(hid.Value));
            }

            Response.Redirect("GroupManagers.aspx");

        }
    }
}