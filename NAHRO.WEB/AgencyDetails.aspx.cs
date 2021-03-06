﻿using NAHRO.Domain;
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
            String hiddenFieldValue = hidTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());

            BindData(1);
        }

        void BindData(int agencyId)
        {
            AgencyServices services = new AgencyServices();
            Agency agency = services.GetAgencyById(agencyId);

            (ctrl1.FindControl("lblAgencyName") as Label).Text = agency.AgencyName;
            (ctrl1.FindControl("lblAddress") as Label).Text = agency.Address;
            

        }


    }
}