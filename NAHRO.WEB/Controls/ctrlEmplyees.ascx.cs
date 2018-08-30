using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using NAHRO.DomainServices;
using NAHRO.WEB.Helper;

namespace NAHRO.WEB
{
    public partial class ctrlEmplyees : System.Web.UI.UserControl
    {

        public SortDirection sortDirection
        {
            get
            {
                if (ViewState["sortdirection"] == null)
                {
                    ViewState["sortdirection"] = SortDirection.Descending;
                    return SortDirection.Descending;
                }
                else if ((SortDirection)ViewState["sortdirection"] == SortDirection.Ascending)
                {
                    ViewState["sortdirection"] = SortDirection.Descending;
                    return SortDirection.Descending;
                }
                else
                {
                    ViewState["sortdirection"] = SortDirection.Ascending;
                    return SortDirection.Ascending;
                }
            }
            set
            {
                ViewState["sortdirection"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            //BindData();

            if (Session["empAdded"] != null && Session["empAdded"].ToString() == "1")
            {
                successMessage.Text = "Employee added successfully.";
            }
        }

        public IQueryable<Domain.Employee> GetActiveEmployees(String OrderBy = null)
        {
            if (ViewState["OrderBy"] != null)
                OrderBy = ViewState["OrderBy"].ToString();
            var list = GetEmployees().AsQueryable();
            if (OrderBy != null)
            {
                switch (sortDirection)
                {
                    case SortDirection.Ascending:
                        list = list.OrderByDescending(OrderBy);
                        break;
                    case SortDirection.Descending:
                        list = list.OrderBy(OrderBy);
                        break;
                    default:
                        list = list.OrderByDescending(OrderBy);
                        break;
                }
            }
            return list;
        }


        protected List<Domain.Employee> GetEmployees()
        {
            EmployeeServices employeeServices = new EmployeeServices();
            List<Domain.Employee> employees = employeeServices.GetAllEmplyees();
            HiddenField hf = (HiddenField)Parent.FindControl("hidLastTab");
            hf.Value = "1";
            return employees;
        }

        protected void lstEmployee_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                EmployeeServices employeeServices = new EmployeeServices();
                employeeServices.DeleteEmployee(id);
                lstEmployee.DataBind();
                successMessage.Text = "Employee removed successfully.";
            }
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstEmployee.FindControl("dtPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            lstEmployee.DataBind();
        }


        protected void lstEmployee_Sorting(object sender, ListViewSortEventArgs e)

        {
            e.Cancel = true;
            ViewState["OrderBy"] = e.SortExpression;
            lstEmployee.DataBind();
        }




        protected void btnD_Click(object sender, EventArgs e)
        {
            string fileName = "Employees.xls";

            EmployeeServices employeeServices = new EmployeeServices();

            DataGrid dg = new DataGrid
            {
                AllowPaging = false,
                DataSource = employeeServices.GetAllEmplyees()
            };

            dg.DataBind();

            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.Buffer = true;
            System.Web.HttpContext.Current.Response.ContentEncoding = Encoding.UTF8;
            System.Web.HttpContext.Current.Response.Charset = "";
            System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition",
              "attachment; filename=" + fileName);

            System.Web.HttpContext.Current.Response.ContentType =
              "application/vnd.ms-excel";
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlTextWriter =
              new System.Web.UI.HtmlTextWriter(stringWriter);
            dg.RenderControl(htmlTextWriter);
            System.Web.HttpContext.Current.Response.Write(stringWriter.ToString());
            System.Web.HttpContext.Current.Response.End();


        }
    }
}