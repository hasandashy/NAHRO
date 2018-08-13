using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB.Controls
{
    public partial class ctrlAssociates : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        void BindData()
        {
            AssociateServices ascServices = new AssociateServices();
            lstEmployee.DataSource = ascServices.GetAllAssociates();
            lstEmployee.DataBind();
        }

        protected void lstEmployee_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                AssociateServices ascServices = new AssociateServices();
                ascServices.DeleteAssociate(id);
                BindData();
            }
        }

    }
}