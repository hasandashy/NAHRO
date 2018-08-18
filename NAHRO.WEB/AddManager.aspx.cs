using NAHRO.Domain;
using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB
{
    public partial class AddManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindData(1);
        }

        void BindData(int agencyId)
        {
            AgencyServices services = new AgencyServices();
            Agency agency = services.GetAgencyById(agencyId);
            (ctrlGroupManagerAdd.FindControl("lblAgencyName") as Label).Text = agency.AgencyName;


        }
    }
}