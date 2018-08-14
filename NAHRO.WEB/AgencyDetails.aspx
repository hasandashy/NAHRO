<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgencyDetails.aspx.cs" Inherits="NAHRO.WEB.AgencyDetails" %>
<%@ Register Src="~/Controls/ctrlAgencyDetails.ascx" TagPrefix="uc1" TagName="ctrlAgency" %>
<%@ Register Src="~/Controls/ctrlEmplyees.ascx" TagPrefix="uc1" TagName="ctrlEmplyees" %>
<%@ Register Src="~/Controls/ctrlAssociates.ascx" TagPrefix="uc1" TagName="ctrlAssociates" %>
<%@ Register Src="~/Controls/ctrlManagers.ascx" TagPrefix="uc1" TagName="ctrlManagers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%--<style>
        @import url("https://fonts.googleapis.com/css?family=Open+Sans:400,600,700");
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
*,
*:before,
*:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html,
body {
  height: 100vh;
}

body {
  font: 14px/1 "Open Sans", sans-serif;
  color: #555;
  background: #eee;
}

h1 {
  padding: 50px 0;
  font-weight: 400;
  text-align: center;
}

p {
  margin: 0 0 20px;
  line-height: 1.5;
}

main {
  min-width: 320px;
  max-width: 800px;
  padding: 50px;
  margin: 0 auto;
  background: #fff;
}

section {
  display: none;
  padding: 20px 0 0;
  border-top: 1px solid #ddd;
}

input {
  display: none;
}

label {
  display: inline-block;
  margin: 0 0 -1px;
  padding: 15px 25px;
  font-weight: 600;
  text-align: center;
  color: #bbb;
  border: 1px solid transparent;
}

label:before {
  font-family: fontawesome;
  font-weight: normal;
  margin-right: 10px;
}

label[for*="1"]:before {
  content: "\f1cb";
}

label[for*="2"]:before {
  content: "\f17d";
}

label[for*="3"]:before {
  content: "\f16b";
}

label[for*="4"]:before {
  content: "\f1a9";
}

label:hover {
  color: #888;
  cursor: pointer;
}

input:checked + label {
  color: #555;
  border: 1px solid #ddd;
  border-top: 2px solid orange;
  border-bottom: 1px solid #fff;
}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4 {
  display: block;
}

@media screen and (max-width: 650px) {
  label {
    font-size: 0;
  }

  label:before {
    margin: 0;
    font-size: 18px;
  }
}
@media screen and (max-width: 400px) {
  label {
    padding: 15px;
  }
}

    </style>--%>

    <main class="col-sm-11 offset-sm-1 col-md-11 offset-md-1 pt-3">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-0">Company Profile</a></li>
                <li><a href="#tabs-1">Employees</a></li>
                <li><a href="#tabs-2">Associates</a></li>
                <li><a href="#tabs-3">Group Managers</a></li>
            </ul>

            <!--WebUserControl.ascx-->
            <div id="tabs-0">
                <uc1:ctrlAgency id="ctrl1" runat="server" />
            </div>
            <div id="tabs-1">
                <uc1:ctrlEmplyees id="ctrl2" runat="server" />
            </div>
            <div id="tabs-2">
                <uc1:ctrlAssociates id="ctrl3" runat="server" />
            </div>
            <div id="tabs-3">
                <uc1:ctrlManagers id="ctrl4" runat="server" />
            </div>

        </div>


        <%-- <input id="tab1" type="radio" name="tabs" checked>
        <label for="tab1">Company Profile</label>

        <input id="tab2" type="radio" name="tabs">
        <label for="tab2">Employees</label>

        <input id="tab3" type="radio" name="tabs">
        <label for="tab3">Associates</label>

        <input id="tab4" type="radio" name="tabs">
        <label for="tab4">Group Managers</label>

        <section id="content1">
            <h3>Company Profile</h3>
            <p>
                National Association of Housing and Redevelopment Officials<br />
                630 I St NW<br />
                Washington, DC 20001-3736
            </p>
        </section>

        <section id="content2">

            <uc1:ctrlEmplyees ID="ucEmp" runat="server" ClientIDMode="Static" />

        </section>

        <section id="content3">
            <uc1:ctrlAssociates ID="ucAsc" runat="server" ClientIDMode="Static" />
        </section>

        <section id="content4">
            <uc1:ctrlManagers ID="ucManager" runat="server" ClientIDMode="Static" />
        </section>--%>
    </main>

    <asp:HiddenField ID="hidLastTab" ClientIDMode="Static" Value="0" runat="server" />

    <script type="text/javascript">


        $('#tabs').tabs({
            activate: function (event, ui) {
                var newIdx = $('#tabs').tabs('option', 'active');
                $('#<%=hidLastTab.ClientID%>').val(newIdx);
                //getUsercontrol(newIdx);
                //$('#tabs' + newIdx).html(getUsercontrol(newIdx));
            },
            active: previouslySelectedTab,
            show: { effect: "fadeIn", duration: 1000 }
           
        });
        function getUsercontrol(thistab) {
            switch (thistab) {
                case 0:
                    userControlName = "Controls/ctrlAgencyDetails.ascx";
                    $("#tabs-" + thistab).load(userControlName);
                    break
                case 1:
                    userControlName = "Controls/ctrlEmplyees.ascx";
                    $("#tabs-" + thistab).load(userControlName);
                    break;
                case 3:
                    userControlName = "Controls/ctrlAssociates.ascx";
                    $("#tabs-" + thistab).load(userControlName);
                    break
                case 4:
                    userControlName = "Controls/ctrlManagers.ascx";
                    $("#tabs-" + thistab).load(userControlName);
                    break;
            }

            //$.ajax({
            //    type: "POST",
            //    url: "AgencyDetails.aspx/GetUserControl",
            //    data: "{controlName:'" + userControlName + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (result) {
            //        //$("#tabs-" + thistab).empty();
            //        //$("#tabs-" + thistab).html(result.d);
            //    }

            //});

        }



    </script>
</asp:Content>
