<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlEmplyees.ascx.cs" Inherits="NAHRO.WEB.ctrlEmplyees" %>

<p>
    <asp:Label ID="lblAgencyName" ClientIDMode="Static" runat="server"></asp:Label>
</p>
<br />
<asp:label ID="successMessage" runat="server" ForeColor="Red"></asp:label>
<br />

<div class="row">
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0">
            <span style="font-size: 1rem; line-height: 1.25; color: #464a4c; background-color: #fff; background-image: none; font-weight: bold;">Actions: </span>&nbsp;&nbsp;<%--<input class="form-control mr-sm-2" type="text" placeholder="Export to File">--%>
            <%--  <button id="btnGo" class="btn btn-outline-success my-2 my-sm-0" type="submit">Go</button>--%>
            <asp:Button ID="btnD" CommandName="btnD" runat="server" CausesValidation="false" class="btn btn-outline-success my-2 my-sm-0" ClientIDMode="Static" OnClick="btnD_Click" Text="Export to File" />
        </div>
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="javascript: window.location.href = 'AddEmployee.aspx';" value="Add Employee" />
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
                        <th>Email</th>
                        <th>Membership Type</th>
                        <th>End Employment </th>
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
                <td><%# Eval("FirstName") + " " + Eval("MiddleName") + " " + Eval("LastName") %></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("Email")%></td>
                <td><%# Eval("MembershipType")%></td>
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Del" CommandArgument='<%# Eval("Id") %>' Text="Remove" OnClientClick='<%# string.Format("return ConfirmDelete(\"{0}\", \"{1}\");", Eval("FirstName"), Eval("LastName")) %>'></asp:LinkButton>
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
    $(document).on('focus',"#enddate", function(){
    $(this).datepicker();
});

    function ConfirmDelete(firstname, lastname) {
       

        $.confirm({
            boxWidth: '40%',
            useBootstrap: false,
            title: 'Confirm End Of Relationship!',
            content: '' +
                '<div>' +
                '<label>Are you sure you want to end the employement relationshiip for this person?</label><br />' +
                '<label>Name:' + lastname + "," + firstname + '</label><br />' +
                '<label>Agency:' + $('#lblAgencyName').text() + '</label><br />' +
                 '<label>Effective Date: <input type="text" id="enddate" name="enddate"></label><br />' +
                '</div>'
                ,

            buttons: {
                "End Relationship":
                    function () {
                        javascript: __doPostBack('ctl00$ContentPlaceHolder1$ctrl2$lstEmployee$ctrl0$DeleteButton', '')
                    },
                Cancel: function () {
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

<script type="text/javascript">   

    //Called this method on any button click  event for Testing
    $("#btnGo").click(function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "AgencyDetails.aspx/EmpExport",

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: "true",
            cache: "false",
            success: function (msg) {
                // On success                 
            },
            Error: function (x, e) {
                // On Error
            }
        });
    }); 
</script>


