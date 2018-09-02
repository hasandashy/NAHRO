using NAHRO.Domain;
using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB.Controls
{
    public partial class ctrlCheckEmployee : System.Web.UI.UserControl
    {
        protected static string companyName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            AgencyServices services = new AgencyServices();
            Agency agency = services.GetAgencyById(1);
            companyName = agency.AgencyName;
        }

      
    }
}