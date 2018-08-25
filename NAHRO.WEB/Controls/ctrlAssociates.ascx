<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlAssociates.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlAssociates" %>
<p>
    <asp:Label ID="lblAgencyName" ClientIDMode="Static" runat="server"></asp:Label>
</p>
<br />
<div class="row">
    <div class="col-sm-12 col-md-12">
        
            Total Associates Allowed : <%= totalAssociates %>
        
       
    </div>
    <div class="col-sm-12 col-md-12">
        
            Current Associates : <%= associatesAssigned %>
        
     
    </div>
    <div class="col-sm-12 col-md-12">
        
            Total Associates Available : <%= associatesAvailable %>
        
        
    </div>
</div>
<br />
<asp:label ID="successMessage" runat="server" ForeColor="Red"></asp:label>
<div class="row">
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0">
            <span style="font-size: 1rem; line-height: 1.25; color: #464a4c; background-color: #fff; background-image: none; font-weight: bold;">Actions: </span>&nbsp;&nbsp;<%--<input class="form-control mr-sm-2" type="text" placeholder="Export to File">--%>
            <asp:Button ID="btnD" CommandName="btnD" runat="server" CausesValidation="false" class="btn btn-outline-success my-2 my-sm-0" ClientIDMode="Static" OnClick="btnD_Click" Text="Export to File" />
        </div>
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="javascript: window.location.href = 'AddAssociate.aspx';" value="Add Associate" />
        </div>
    </div>
</div>
<br />

<div class="table-responsive">
    <asp:ListView ID="lstEmployee" runat="server" OnItemCommand="lstEmployee_ItemCommand" OnPagePropertiesChanging="OnPagePropertiesChanging">
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
                <td><%# Eval("EmpId")%></td>
                <td><%# Eval("Name")%></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("MembershipType")%></td>
                <td><%# Eval("Email")%></td>
                <td><%# Eval("CurrentOrder")%></td>
                <td><%# Eval("ProformaOrder")%></td>
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Del" CommandArgument='<%# Eval("Id") %>' Text="Terminate" OnClientClick='<%# string.Format("return ConfirmDelete(\"{0}\", \"{1}\");", Eval("Name"), Eval("Name")) %>'></asp:LinkButton>
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

<script type="text/javascript">
    function ConfirmDelete(firstname,lastname) {


        $.confirm({
            boxWidth: '40%',
            useBootstrap: false,
            title: 'Confirm Terminate Associate!',
            content: '' +
                '<div>' +
                '<label>Are you sure you want to terminate the associate membership of this person?</label><br />' +
                '<label>Name:' + lastname + "," + firstname + '</label><br />' +
                '<label>Agency:' + $('#lblAgencyName').text() + '</label><br />' +
                '</div>',
            buttons: {
                "Terminate":
                    function () {
                        javascript: __doPostBack('ctl00$ContentPlaceHolder1$ctrl3$lstEmployee$ctrl0$DeleteButton', '');                        

                    },
                cancel: function () {
                    $.alert('Canceled!');
                }
            }
        });
        return false;
    }

    $(function () {
        $(".aspNetDisabled").each(function () {
            var str = $(this).text();
            if (str == "Previous" || str == "Next") {
                $(this).hide();
            }
        });
    })

</script>




