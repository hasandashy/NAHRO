<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroupManagers.aspx.cs" Inherits="NAHRO.WEB.GroupManagers" %>

<%--<%@ Register Src="~/Controls/ctrlEmplyees.ascx" TagPrefix="uc1" TagName="ctrlEmplyees" %>
<%@ Register Src="~/Controls/ctrlEmplyees.ascx" TagPrefix="uc1" TagName="ctrlEmplyees" %>
<%@ Register Src="~/Controls/ctrlAssociates.ascx" TagPrefix="uc1" TagName="ctrlAssociates" %>
<%@ Register Src="~/Controls/ctrlManagers.ascx" TagPrefix="uc1" TagName="ctrlManagers" %>--%>
<%@ Register Src="~/Controls/ctrlManagers.ascx" TagPrefix="uc1" TagName="ctrlManagers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

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
                    <%--<uc1:ctrlAgency ID="ctrl1" runat="server" />--%>
                </div>
                <div id="tabs-1">
                    <%--<uc1:ctrlEmplyees ID="ctrl2" runat="server" />--%>
                </div>
                <div id="tabs-2">
                    <%-- <uc1:ctrlAssociates ID="ctrl3" runat="server" />--%>
                </div>
                <div id="tabs-3">
                    <form runat="server">
                        <uc1:ctrlManagers ID="ctrl4" runat="server" />
                        <asp:HiddenField ID="hidLastTab" ClientIDMode="Static" Value="0" runat="server" />
                        <asp:HiddenField ID="hidTab" ClientIDMode="Static" Value="3" runat="server" />
                    </form>
                </div>
            </div>
        </main>

    
    <script type="text/javascript">



        $('#tabs').tabs({
            activate: function (event, ui) {
                var newIdx = $('#tabs').tabs('option', 'active');
                $('[id$=hidTab]').val(newIdx);
                if (newIdx == 0) {
                    window.location.href = "AgencyDetails.aspx";

                }
                if (newIdx == 1) {
                    window.location.href = "Employees.aspx";

                }
                if (newIdx == 2) {
                    window.location.href = "Associates.aspx";

                }
                if (newIdx == 3) {
                    window.location.href = "GroupManagers.aspx";

                }

            },
            active: previouslySelectedTab

        });
    </script>
</asp:Content>


