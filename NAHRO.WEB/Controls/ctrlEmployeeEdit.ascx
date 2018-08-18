<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlEmployeeEdit.ascx.cs" Inherits="NAHRO.WEB.Controls.ctrlEmployeeEdit" %>
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
    <h4>Edit Employee </h4>
    <br />
    <div class="form-group row">
        <div class="col-lg-12">
            <span>*Required</span>
        </div>
    </div>



    <div class="frm" id="frm2">
        <form id="employeeForm">
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
                <label for="email" class="col-lg-4 col-form-label">Email:</label>
                <div class="col-lg-8">
                    <input type="email" class="form-control" name="email" id="email">
                </div>
            </div>
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

        $('#employeeForm').validate({
            errorClass: 'error',
            rules: {
                email: {
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
                }
            },
            messages: {
                fname: "email is required.",
                fname: "first name is required.",
                lname: "last name is required.",
                jtitle: "job title is required."
            }
        });



    });

   

    $("#btnSave").click(function (e) {
        if ($('#employeeForm').valid()) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "EditEmployee.aspx/UpdateEmployee",
                data: JSON.stringify({
                    email: $("#email").val(),
                    prefix: $("#prefix").val(),
                    fname: $("#fname").val(),
                    mname: $("#mname").val(),
                    lname: $("#lname").val(),
                    nickName: $("#nickname").val(),
                    suffix: $("#suffix").val(),
                    agencyId: 1,
                    phone: $("#phone").val(),
                    fax: $("#fax").val(),
                    jobTitle: $("#jtitle").val()
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    window.location.href = "Employees.aspx";
                },
                error: function (result) {
                    alert("Error while saving records.");
                }
            });
        }
    });

</script>
