<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="NAHRO.WEB.EditEmployee" %>

<%@ Register Src="~/Controls/ctrlEmployeeEdit.ascx" TagPrefix="uc1" TagName="ctrlEmployeeEdit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctrlEmployeeEdit runat="server" ID="ctrlEmployeeEdit" />
</asp:Content>
