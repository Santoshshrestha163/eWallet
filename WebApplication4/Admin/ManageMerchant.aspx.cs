using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace WebApplication4.Admin
{
    public partial class ManageMerchant : System.Web.UI.Page
    {
        EwalletDBEntities db = new EwalletDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategory();
                Image1.ImageUrl = "~/ProductImages/noimage.jpg";
                LoadGrid();

            }
        }

        private void LoadGrid()
        {
            List<tblmerchant> lstmer = db.tblmerchants.ToList();
            GridView1.DataSource = lstmer;
            GridView1.DataBind();
        }

        private void LoadCategory()
        {
            List<tblCategory1> lstcat = db.tblCategory1.ToList();
            ddlCategorytype.DataSource = lstcat;
            ddlCategorytype.DataTextField = "Categoryname";
            ddlCategorytype.DataValueField = "Categoryid";
            ddlCategorytype.DataBind();
            ddlCategorytype.Items.Insert(0, "Choose Category");
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            tblmerchant tb = new tblmerchant();
            tb.Categoryid =Convert.ToInt32( ddlCategorytype.SelectedValue.ToString());
            tb.Merchantname = txtMerchant.Text;
            if (FileUpload2.HasFile)
            {
                tb.Photo = FileUpload2.FileName;
                FileUpload2.SaveAs(Server.MapPath("~/ProductImages/" + FileUpload2.FileName));
            }
            else
            {
                tb.Photo = "noimage.jpg";
            }
            db.tblmerchants.Add(tb);
          
            int i = db.SaveChanges();
            if (i > 0)
            {
               
                Image1.ImageUrl = "~/ProductImages/" + FileUpload2.FileName;
                lblMessage.Text = "merchant Created";
                LoadGrid();
                
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int Merchantid = Convert.ToInt32(HiddenField1.Value);
            tblmerchant tb = db.tblmerchants.Where(u => u.Merchantid ==Merchantid).FirstOrDefault();
            tb.Categoryid = Convert.ToInt32(ddlCategorytype.SelectedValue.ToString());
            tb.Merchantname = txtMerchant.Text;
            
            if (FileUpload2.HasFile)
            {
                tb.Photo = FileUpload2.FileName;
                FileUpload2.SaveAs(Server.MapPath("~/ProductImages/" + FileUpload2.FileName));
                Image1.ImageUrl = "~/ProductImages/" + FileUpload2.FileName;
           
                File.Delete(Server.MapPath("~/ProductImages/" + HiddenField2.Value));
            }
            else
            {
                tb.Photo = HiddenField2.Value;
            }

            int i = db.SaveChanges();
            if (i > 0)
            {
                lblMessage.Text = "Merchant Updated";
                LoadGrid();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int Merchantid = Convert.ToInt32(HiddenField1.Value);
            tblmerchant tb = db.tblmerchants.Where(p => p.Merchantid == Merchantid).FirstOrDefault();
            db.tblmerchants.Remove(tb);
            int i = db.SaveChanges();
            if (i > 0)
            {
                lblMessage.Text = "merchant Deleted";
                LoadGrid();
                File.Delete(Server.MapPath("~/ProductImages/" + HiddenField2.Value));

                ddlCategorytype.SelectedIndex = 0;
                txtMerchant.Text = "";
               
                Image1.ImageUrl = "~/ProductImages/noimage.jpg";
                txtMerchant.Focus();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Merchantid = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            HiddenField1.Value = Merchantid.ToString();
            tblmerchant tb = db.tblmerchants.Where(p => p.Merchantid == Merchantid).FirstOrDefault();
            ddlCategorytype.SelectedValue = tb.Categoryid.ToString();
            txtMerchant.Text = tb.Merchantname;
            Image1.ImageUrl = "~/ProductImages/" + tb.Photo;
            HiddenField2.Value = tb.Photo;
        }
    }
}