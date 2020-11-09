using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QLVT_DATHANG
{
    public partial class Form1 : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public Form1()
        {
            InitializeComponent();
        }
        private Form checkExist(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f.GetType() == ftype)
                {
                    return f;
                }
            }
            return null;
        }

        private void btnNhanVien_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form f = this.checkExist(typeof(frmNhanVien));
            if (f != null)
            {
                f.Activate();
            }
            else
            {
                frmNhanVien fNV = new frmNhanVien();
                fNV.MdiParent = this;
                fNV.Show();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (Program.mGroup.Equals("CHINHANH") || Program.mGroup.Equals("CONGTY"))
            {
                btnTaoLogin.Enabled = true;
            }
            else
            {
                btnTaoLogin.Enabled = false;
            }
        }

        private void btnDangXuat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnTaoLogin_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.checkExist(typeof(frmTaoLogin));
            if (frm != null) frm.Activate();
            else
            {
                frmTaoLogin f = new frmTaoLogin();
                f.MdiParent = this;
                f.Show();
            }
        }
    }
}
