<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAssociate.aspx.cs" Inherits="NAHRO.WEB.AddAssociate" %>

<%@ Register Src="~/Controls/ctrlAddAssociate.ascx" TagPrefix="uc1" TagName="ctrlAddAssociate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="col-sm-11 offset-sm-1 col-md-11 offset-md-1 pt-3">
    <form runat="server">
    <uc1:ctrlAddAssociate runat="server" id="ctrlAddAssociate" />
        </form>
         </main>
</asp:Content>
