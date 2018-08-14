using NAHRO.DomainServices;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NAHRO.WEB
{
    public partial class AgencyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String hiddenFieldValue = hidLastTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());
        }

        [WebMethod]
        public static string GetUserControl(string controlName)
        {

            using (Page page = new Page())
            {
                HtmlForm form = new HtmlForm();
                UserControl userControl = (UserControl)page.LoadControl("~/Controls/" + controlName);
                form.Controls.Add(userControl);
                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(form);
                    HttpContext.Current.Server.Execute(page, writer, false);
                    return writer.ToString();
                }

            }
        }

    }
}