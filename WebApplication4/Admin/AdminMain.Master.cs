using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4.Admin
{
    public partial class AdminMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"]!=null)
                {
                    if (Session["Fullname"] != null)
                    {
                        lblFullname.Text = Session["Fullname"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../Login.aspx");
        }
    }
}