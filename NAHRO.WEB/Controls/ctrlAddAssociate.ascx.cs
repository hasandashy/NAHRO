using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB.Controls
{
    public partial class ctrlAddAssociate : System.Web.UI.UserControl
    {
        protected int totalAssociates = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["associatesAllowed"]);
        protected int associatesAssigned = 0;
        protected int associatesAvailable = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
                BindData();
        }

        void BindData()
        {
            AssociateServices ascServices = new AssociateServices();
            lstEmployee.DataSource = ascServices.GetNewAssociates();
            lstEmployee.DataBind();
            associatesAssigned = ascServices.GetAssociatesCount();
            associatesAvailable = totalAssociates - associatesAssigned;
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
                AssociateServices ascServices = new AssociateServices();
                ascServices.AddAssociate(Convert.ToInt32(hid.Value));
            }

            string prompt = "$.alert('Associate successfully added.');";
            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", prompt, true);

            //Response.Redirect("Associates.aspx");
        }
    }
}