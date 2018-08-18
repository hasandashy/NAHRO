<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddManager.aspx.cs" Inherits="NAHRO.WEB.AddManager" %>

<%@ Register Src="~/Controls/ctrlGroupManagerAdd.ascx" TagPrefix="uc1" TagName="ctrlGroupManagerAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="col-sm-11 offset-sm-1 col-md-11 offset-md-1 pt-3">
        <form runat="server">
            <uc1:ctrlGroupManagerAdd runat="server" ID="ctrlGroupManagerAdd" />
        </form>
    </main>
</asp:Content>
