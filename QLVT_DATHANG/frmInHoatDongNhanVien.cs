using DevExpress.XtraReports.UI;
using QLVT_DATHANG.BaoCao;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLVT_DATHANG
{
    public partial class frmInHoatDongNhanVien : Form
    {
        public frmInHoatDongNhanVien()
        {
            InitializeComponent();
        }

        private void sp_DSNhanVienBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.sp_DSNhanVienBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void frmInHoatDongNhanVien_Load(object sender, EventArgs e)
        {
            txtMaNV.Enabled = false;
            this.dataSet.EnforceConstraints = false;
            this.sp_DSNhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
            this.sp_DSNhanVienTableAdapter.Fill(this.dataSet.sp_DSNhanVien);
           

        }

    

        private void button1_Click(object sender, EventArgs e)
        {
            int manv = int.Parse(txtMaNV.Text);
            String loai = cmbPhieu.Text.Substring(0, 1);
            String bd = dateTimePicker1.Text;
            String kt = dateTimePicker2.Text;
           
            if (bd.CompareTo(kt)>0)
            {
                MessageBox.Show("Ngày kết thúc không được nhỏ hơn ngày bắt đầu", string.Empty, MessageBoxButtons.OK);
                return;
            }

            Report_SP_HDNV rp = new Report_SP_HDNV(manv,loai,bd,kt);

            rp.label1.Text = "HOẠT ĐỘNG NHÂN VIÊN " + "PHIẾU " + cmbPhieu.Text.ToUpper() + " TỪ NGÀY " + bd + " ĐẾN NGÀY " + kt;

            ReportPrintTool print = new ReportPrintTool(rp);
            print.ShowPreviewDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
