<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlAssociates.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlAssociates" %>
<p>National Association of Housing and Redevelopment Officials</p>
<br />
<div class="row">
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0">
            <span style="font-size: 1rem; line-height: 1.25; color: #464a4c; background-color: #fff; background-image: none; font-weight: bold;">Actions: </span>&nbsp;&nbsp;<input class="form-control mr-sm-2" type="text" placeholder="Export to File">
            <button id="btnGo" class="btn btn-outline-success my-2 my-sm-0" type="submit">Go</button>
        </div>
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Add Employee</button>
        </div>
    </div>
</div>
<br />

<div class="table-responsive">
    <asp:ListView ID="lstEmployee" runat="server" OnItemCommand="lstEmployee_ItemCommand">
        <LayoutTemplate>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Job Title</th>
                        <th>Membership Type</th>
                        <th>Email</th>
                        <th>Current Order</th>
                        <th>Proforma Order </th>
                        <th>Terminate Associate Membership </th>
                    </tr>
                </thead>
                <tbody>

                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />


                </tbody>
            </table>

        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("EmpId")%></td>
                <td><%# Eval("Name")%></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("MembershipType")%></td>
                <td><%# Eval("Email")%></td>
                <td><%# Eval("CurrentOrder")%></td>
                <td><%# Eval("ProformaOrder")%></td>                
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Del" CommandArgument='<%# Eval("Id") %>' Text="Terminate" OnClientClick="return confirm('Are you certain you want to delete this record?');"></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <%--<AlternatingItemTemplate>
      <div style="border: solid 1px #336699; background-color: #dadada;">
         <%# Eval("ProductName")%>
      </div>
   </AlternatingItemTemplate>--%>
        <EmptyDataTemplate>
            No records found
        </EmptyDataTemplate>
    </asp:ListView>
</div>



