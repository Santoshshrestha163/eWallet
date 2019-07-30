using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace WebApplication4
{
    public partial class Login : System.Web.UI.Page
    {
        EwalletDBEntities db = new EwalletDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            tblUser tb = db.tblUsers.Where(u => u.Username == txtUsername.Text && u.Password == txtPassword.Text && u.Usertype == "Admin").FirstOrDefault();

            if (tb != null)
            {
                //store
                Session.Add("Username", txtUsername.Text);

                Session.Add("Fullname", tb.Fullname);
                Response.Redirect("~/Admin/AdminMenu.aspx");
            }
            else
            {
                 lblMaessage.Text = "Invalid User";
                lblMaessage.ForeColor = Color.Red;
            }

        }
    }
}