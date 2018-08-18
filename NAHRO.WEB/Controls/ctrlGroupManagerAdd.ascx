﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlGroupManagerAdd.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlGroupManagerAdd" %>
<p><asp:Label ID="lblAgencyName" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label></p>
<br />
<div class="row">
    <div class="col-sm-6 col-md-6">
       
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-outline-success my-2 my-sm-0" Text="Add" OnClick="btnSubmit_Click"/>
        </div>
    </div>
</div>
<br />

<div class="table-responsive">
    <asp:ListView ID="lstEmployee" runat="server"  OnPagePropertiesChanging="OnPagePropertiesChanging">
        <LayoutTemplate>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th><asp:CheckBox ID="CheckboxHeader"  runat="server" /></th>
                        <th>Name</th>
                        <th>Job Title</th>
                        <th>Email</th>
                        
                    </tr>
                </thead>
                <tbody>

                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />


                </tbody>
                  <tr>
                    <td colspan="6">
                        <asp:DataPager ID="dtPager" runat="server" PagedControlID="lstEmployee" PageSize="2">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                    ShowNextPageButton="false" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>

        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <asp:HiddenField ID="HidId" ClientIDMode="Static" runat="server" Value='<%# Eval("Id")%>' />
                 <td><asp:CheckBox ID="Checkbox"  runat="server" /></td>
                <td><%# Eval("Name")%></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("Email")%></td>
                
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            No records found
        </EmptyDataTemplate>
    </asp:ListView>
</div>

