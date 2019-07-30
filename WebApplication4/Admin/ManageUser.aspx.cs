using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace WebApplication4.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        EwalletDBEntities db = new EwalletDBEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (!IsPostBack)
                {
                LoadGrid();
                }
        }
        public bool checkUser(string username)
        {
            List<tblUser> lstusers = (from u in db.tblUsers.Where(a => a.Username == username) select u).ToList();
            if (lstusers.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void LoadGrid()
        {
            List<tblUser> user = db.tblUsers.ToList();
            GridView1.DataSource = user;
            GridView1.DataBind();
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
          


            bool chk = checkUser(txtUsername.Text);
            if (chk)
            {
                lblMessage.Text = "Username Already Taken";
                lblMessage.ForeColor = Color.Red;
            }
            else
            {
                tblUser tb = new tblUser();
                
                tb.Username = txtUsername.Text;
               


                    tb.Password = txtPassword.Text;
                
                tb.Usertype = ddlUsertype.Text;
                tb.Fullname = txtFullname.Text;
                db.tblUsers.Add(tb);
                
                lblMessage.Text = "user Created";
                db.SaveChanges();
                LoadGrid();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            HiddenField1.Value = GridView1.SelectedRow.Cells[1].Text.ToString();
            txtUsername.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
            txtPassword.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
            ddlUsertype.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
            txtFullname.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField1.Value);
            tblUser tb = (from u in db.tblUsers.Where(a => a.id == id) select u).FirstOrDefault();
            tb.Username = txtUsername.Text;
            tb.Password = txtPassword.Text;
            tb.Usertype = ddlUsertype.Text;
            tb.Fullname = txtFullname.Text;
            db.SaveChanges();
            lblMessage.Text = "user Updated";
            LoadGrid();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField1.Value);
            tblUser tb = (from u in db.tblUsers.Where(a => a.id == id) select u).FirstOrDefault();
            db.tblUsers.Remove(tb);
            db.SaveChanges();
            lblMessage.Text = "user Deleted";
            LoadGrid();

        }

        

        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.ToString().Length > 8;
        }
    }
 }

  

     
    

