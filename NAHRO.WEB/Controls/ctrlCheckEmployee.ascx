<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlCheckEmployee.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlCheckEmployee" %>
<style>
    .frm {
        width: 50%;
    }

    .error {
        color: red;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js" type="text/javascript"></script>
<main class="col-sm-11 offset-sm-1 col-md-11 offset-md-1 pt-3 ">
    <h4>Add New Individual </h4>
    <br />
    <div class="form-group row">
        <div class="col-lg-12">
            <span>*Required</span>
        </div>
    </div>
    <div class="form-group row" id="emailcheck">
        <div class="col-lg-12">
            <span>Enter the email address or first name and last name of the person you would like to add. We will check our records to see if this person is already in our system.</span>
        </div>
    </div>

    <div class="frm" id="frm1">
        <form id="myform">
            <div class="form-group row">
                <label for="email" class="col-lg-4 col-form-label">Email:</label>
                <div class="col-lg-8">
                    <input type="email" class="form-control" name="email" id="email">
                </div>

            </div>
            <div class="form-group row">
                <div class="col-lg-4">
                </div>
                <div class="col-lg-8">
                    <b>OR</b>
                </div>

            </div>
        </form>
        <form id="myformName">
            <div class="form-group row">
                <label for="FirstName" class="col-lg-4 col-form-label">First Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="FirstName" id="FirstName">
                </div>
            </div>
            <div class="form-group row">
                <label for="LastName" class="col-lg-4 col-form-label">Last Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="LastName" id="LastName">
                </div>
            </div>

        </form>
        <div class="form-group row">
            <div class="col-lg-4">
            </div>
            <div class="col-lg-8">
                <button id="btnCheck" class="btn btn-primary" name="submit" type="submit">Check</button>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-lg-12">
                <span id="message"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-lg-8">
                <button id="btnAdditionalDetails" class="btn btn-primary" name="submit" type="submit">Add Individual Details</button>
            </div>
            <div class="col-lg-8">
            </div>
        </div>

    </div>
    <div class="frm" id="frm2">
        <form id="employeeForm">
            <div class="form-group row">
                <label for="name" class="col-lg-4 col-form-label">Email:</label>
                <div class="col-lg-8">
                    <input type="email" class="form-control" name="emailaddress" id="emailaddress">
                </div>

            </div>
            <div class="form-group row">
                <div class="col-lg-4"></div>
                <div class="col-lg-8">
                    <input type="checkbox" name="chksendemail" id="chksendemail">&nbsp;send login details to this email address.
                </div>

            </div>
            <div class="form-group row">
                <label for="name" class="col-lg-4 col-form-label">Email Location:</label>
                <div class="col-lg-8">
                    <select class="form-control" id="emailLocation">
                        <option value="Work">Work</option>
                        <option value="Mobile">Mobile</option>
                        <option value="Home">Home</option>
                    </select>
                </div>

            </div>
            <hr>
            <div class="form-group row">
                <label for="prefix" class="col-lg-4 col-form-label">prefix:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="prefix" id="prefix">
                </div>
            </div>
            <div class="form-group row">
                <label for="fname" class="col-lg-4 col-form-label">First Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="fname" id="fname">
                </div>
            </div>
            <div class="form-group row">
                <label for="mname" class="col-lg-4 col-form-label">Middle Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="mname" id="mname">
                </div>
            </div>
            <div class="form-group row">
                <label for="lname" class="col-lg-4 col-form-label">Last Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="lname" id="lname">
                </div>
            </div>
            <div class="form-group row">
                <label for="nickname" class="col-lg-4 col-form-label">Nick Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="nickname" id="nickname">
                </div>
            </div>
            <div class="form-group row">
                <label for="suffix" class="col-lg-4 col-form-label">suffix:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="suffix" id="suffix">
                </div>
            </div>
            <hr>
            <div class="form-group row">
                <label for="cname" class="col-lg-4 col-form-label">Company Name:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="cname" id="cname">
                </div>
            </div>
            <div class="form-group row">
                <label for="phone" class="col-lg-4 col-form-label">Phone:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="phone" id="phone">
                </div>
            </div>
            <div class="form-group row">
                <label for="fax" class="col-lg-4 col-form-label">Fax:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="fax" id="fax">
                </div>
            </div>
            <div class="form-group row">
                <label for="jtitle" class="col-lg-4 col-form-label">Job Title:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="jtitle" id="jtitle">
                </div>
            </div>
            <div class="form-group row">
                <label for="role" class="col-lg-4 col-form-label">Role:</label>
                <div class="col-lg-8">
                    <select class="form-control" id="role">
                        <option>Employee</option>
                    </select>

                </div>
            </div>
            <div class="form-group row">
                <label for="startDate" class="col-lg-4 col-form-label">Start Date:</label>
                <div class="col-lg-8">
                    <input type="text" class="form-control" name="startDate" id="startDate">
                </div>
            </div>
            <div class="form-group row">
                <!-- Submit button !-->
                <div class="col-lg-4 col-form-label">
                </div>
                <div class="col-lg-8">
                    <button id="btnSave" class="btn btn-primary" name="submit" type="submit">Save</button>
                </div>
            </div>
        </form>
    </div>
</main>
<script>
    $(document).ready(function () {
        $('#btnAdditionalDetails').hide();
        $('#frm2').hide();
        $("#startDate").datepicker();

        $("#cname").val('<%= companyName%>');
        $('#cname').attr('readonly', true);

        //    $("#startDate").datepicker({
        //  showOn: "button",
        //  buttonImage: "images/calendar.gif",
        //  buttonImageOnly: true,
        //  buttonText: "Select date"
        //});

        $('#myformName').validate({
            errorClass: 'error',
            rules: {
                FirstName: {
                    required: true
                },
                LastName: {
                    required: true
                }
            }
        });

        $('#myform').validate({
            errorClass: 'error',
            rules: {
                email: {
                    required: true
                }
            }
        });



        $('#employeeForm').validate({
            errorClass: 'error',
            rules: {
                emailaddress: {
                    required: true
                },
                fname: {
                    required: true
                },
                lname: {
                    required: true
                },
                jtitle: {
                    required: true
                },
                startDate: {
                    required: true
                }
            },
            messages: {
                fname: "first name is required.",
                lname: "last name is required.",
                jtitle: "membership type is required.",
                startDate: "start date is required.",
            }
        });



    });

    $("#btnAdditionalDetails").click(function (e) {
        $('#btnAdditionalDetails').hide();
        $('#frm2').show();
        $('#frm1').hide();
        if ($("#email").val() != '') {
            $('#emailaddress').val($("#email").val());
            $('#emailaddress').attr('readonly', true);

        }
        else if ($("#FirstName").val() != '') {
            $('#fname').val($("#FirstName").val());
            $('#lname').val($("#LastName").val());
            $('#fname').attr('readonly', true);
            $('#lname').attr('readonly', true);
        }
        e.preventDefault();
    });
    $("#btnCheck").click(function (e) {
        if ($('#FirstName').val() != '' || $('#LastName').val() != '') {
            if ($('#myformName').valid()) {
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "AddEmployee.aspx/CheckName",
                    data: JSON.stringify({
                        firstname: $("#FirstName").val(),
                        lastname: $("#LastName").val()
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result.d == false) {
                            $('#message').text('this user already exists in our system.');
                            $('#btnAdditionalDetails').hide();
                        } else {
                            $('#message').text('We did not find a match to this user in the system. Would you like to add details about this person?')
                            $('#btnAdditionalDetails').show();
                        }
                    },
                    error: function (result) {
                        $('message').text('this email address already exists in our system.');
                    }
                });
            }
        }
        else if ($('#myform').valid()) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "AddEmployee.aspx/CheckEmail",
                data: JSON.stringify({
                    email: $("#email").val()
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.d == false) {
                        $('#message').text('this email address already exists in our system.');
                        $('#btnAdditionalDetails').hide();
                    } else {
                        $('#message').text('We did not find a match to this email in the system. Would you like to add details about this person?')
                        $('#btnAdditionalDetails').show();
                    }
                },
                error: function (result) {
                    $('message').text('this email address already exists in our system.');
                }
            });
        }

    });

    $("#btnSave").click(function (e) {
        if ($('#employeeForm').valid()) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "AddEmployee.aspx/AddEmployee",
                data: JSON.stringify({
                    email: $("#emailaddress").val(),
                    prefix: $("#prefix").val(),
                    fname: $("#fname").val(),
                    mname: $("#mname").val(),
                    lname: $("#lname").val(),
                    nickName: $("#nickname").val(),
                    suffix: $("#suffix").val(),
                    agencyId: 1,
                    phone: $("#phone").val(),
                    fax: $("#fax").val(),
                    jobTitle: $("#jtitle").val(),
                    membershipStartDate: $("#startDate").val(),
                    emailLocation: $('#emailLocation').val()
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if ($('#chksendemail').is(":checked")) {
                        // make a call to mail sending method here
                    }
                    window.location.href = "Employees.aspx";
                    //$.alert("Employee successfully added.");
                },
                error: function (result) {
                    alert("Error while saving records.");
                }
            });
        }
    });

</script>
