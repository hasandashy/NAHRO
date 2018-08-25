<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlManagers.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlManagers" %>
<%@ Register Src="~/Controls/ctrlGroupManagerAdd.ascx" TagPrefix="uc1" TagName="ctrlGroupManagerAdd" %>


<p>
    <asp:Label ID="lblAgencyName" ClientIDMode="Static" runat="server"></asp:Label></p>
<br />
<asp:label ID="successMessage" runat="server" ForeColor="Red"></asp:label>
<br />

<div class="row">
    <div class="col-sm-12 col-md-12">
        Total Managers Allowed : <%= totalManagers %>
    </div>
    <div class="col-sm-12 col-md-12">
        Current Managers : <%= managersAssigned %>
    </div>
    <div class="col-sm-12 col-md-12">
        Total Managers Available : <%= managersAvailable %>
    </div>
</div>
<br />
<div class="row">
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0">
            <span style="font-size: 1rem; line-height: 1.25; color: #464a4c; background-color: #fff; background-image: none; font-weight: bold;">Actions: </span>&nbsp;&nbsp;<%--<input class="form-control mr-sm-2" type="text" placeholder="Export to File">--%>
            <asp:Button ID="btnD" CommandName="btnD" runat="server" CausesValidation="false" class="btn btn-outline-success my-2 my-sm-0" ClientIDMode="Static" OnClick="btnD_Click" Text="Export to File" />
        </div>
    </div>
    <div class="col-sm-6 col-md-6">
        <div class="form-inline mt-2 mt-md-0" style="float: right;">
            <%-- <input type=button  class="btn btn-outline-success my-2 my-sm-0" onclick="javascript:window.location.href='AddManager.aspx';" value="Add Manager" />--%>
            <input type="button" id="btnAdd" class="btn btn-outline-success my-2 my-sm-0" value="Add Manager" />
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
                <td><%# Eval("Name")%></td>
                <td><%# Eval("JobTitle")%></td>
                <td><%# Eval("Email")%></td>
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Del" CommandArgument='<%# Eval("Id") %>' Text="Un-Designate" OnClientClick='<%# string.Format("return ConfirmDelete(\"{0}\", \"{1}\");", Eval("Name"), Eval("Name")) %>'></asp:LinkButton>
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
<div id="divMemoInfo" style="display: none;">
    <uc1:ctrlGroupManagerAdd runat="server" ID="ctrlGroupManagerAdd" />
</div>


<script type="text/javascript">
    function ConfirmDelete(firstname,lastname) {


        $.confirm({
           boxWidth: '40%',
            useBootstrap: false,
            title: 'Confirm Un-designate Group Manager!',
            content: '' +
                '<div>' +
                '<label>Are you sure you want to un-designate this contact from group manager list?</label><br />' +
                '<label>Name:' + lastname + "," + firstname + '</label><br />' +
                '<label>Agency:' + $('#lblAgencyName').text() + '</label><br />' +
                '</div>'
                ,buttons: {
                "Un-designate":
                    function () {
                        javascript:__doPostBack('ctl00$ContentPlaceHolder1$ctrl4$lstEmployee$ctrl0$DeleteButton','')
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

    $(function () {
        PrepareNOpenDialog();
        $("#divMemoInfo").parent().appendTo($('form'));

    });

    function PrepareNOpenDialog() {

        $('#divMemoInfo').dialog(); //init the dialog (consider div as a dialog)
        $('#divMemoInfo').dialog('close'); //prevent the dialog from showing after initiation

        dialogOptions = {
            modal: true
            , buttons: {
                'Close': function () {
                    $(this).dialog('close');
                }
            }
            , minWidth: 400
            , minHeight: 200
            , width: $(window).width() / 1.5 //'auto'
            , height: 'auto'

        };

        //open dialog when image clicked
        $('#btnAdd').click(function () {
            $('#divMemoInfo').dialog(dialogOptions);
        });

    }


</script>
