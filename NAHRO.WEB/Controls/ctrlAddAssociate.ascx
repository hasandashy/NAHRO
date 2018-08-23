<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlAddAssociate.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlAddAssociate" %>
<p><asp:Label ID="lblAgencyName" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label></p>
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
<div class="row">
    <div class="col-sm-6 col-md-6">
       
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <asp:Button ID="btnSubmit" runat="server" class="btn btn-outline-success my-2 my-sm-0" Text="Add" OnClientClick='return validate();' OnClick="btnSubmit_Click"/>
        </div>
    </div>
</div>
<br />

<div class="table-responsive">
    <asp:ListView ID="lstEmployee" runat="server" OnPagePropertiesChanging="OnPagePropertiesChanging">
        <LayoutTemplate>
            <table id="lvAssociate" class="table table-striped">
                <thead>
                    <tr>
                        <th><asp:CheckBox ID="CheckboxHeader"  runat="server" /></th>
                        <th>Name</th>
                        <th>Job Title</th>
                        <th>Membership Type</th>
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
                <td><asp:CheckBox ID="Checkbox" ClientIDMode="Static" runat="server" /></td>
                <td><%# Eval("Name")%></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("MembershipType")%></td>
                <td><%# Eval("Email")%></td>            
              
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
<script>
$(function () {
        $(".aspNetDisabled").each(function () {
            var str = $(this).text();
            if (str == "Previous" || str == "Next") {
                $(this).hide();
            }
            });
    })

    function validate() {   

       var totalChecked = $("#lvAssociate tr input[type='checkbox']:checked").length;
        
        var associate =<%= this.associatesAvailable %>;
        if (totalChecked > associate) {
            $.alert('You can only select ' + associate + ' associates.');
            return false;
        }

    }
</script>