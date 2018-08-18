using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAHRO.WEB
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void UpdateEmployee(string email, string prefix, string fname, string mname, string lname, string nickName, string suffix, int agencyId, string phone, string fax, string jobTitle)
        {

        }
    }
}