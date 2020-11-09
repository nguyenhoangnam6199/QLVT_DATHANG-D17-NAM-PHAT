using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLVT_DATHANG
{
    public partial class frmVatTu : Form
    {
        private int vitri;
        private string nut;
        public frmVatTu()
        {
            InitializeComponent();
        }

        private void vattuBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.vattuBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void frmVatTu_Load(object sender, EventArgs e)
        {

            LoadTable();

        }

        private void vattuBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            this.Validate();
            this.vattuBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void vattuBindingNavigatorSaveItem_Click_2(object sender, EventArgs e)
        {
            this.Validate();
            this.vattuBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void mAVTLabel_Click(object sender, EventArgs e)
        {

        }

        private void LoadTable()
        {
            this.dataSet.EnforceConstraints = false;

            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dataSet.Vattu);

            this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTDDHTableAdapter.Fill(this.dataSet.CTDDH);

            this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPNTableAdapter.Fill(this.dataSet.CTPN);

            this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTPXTableAdapter.Fill(this.dataSet.CTPX);

            if (Program.mGroup == "CONGTY")
            {
                btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
                btnReload.Enabled = true;
                groupBox1.Enabled = false;

            }
            else
            {
                btnSua.Enabled = btnXoa.Enabled =  btnReload.Enabled = btnThem.Enabled = true;
                btnUndo.Enabled = btnGhi.Enabled = false;
                groupBox1.Enabled = false;
            }
        }

        private void DisableForm()
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnReload.Enabled = false;
            btnGhi.Enabled = btnThoat.Enabled = btnUndo.Enabled = true;
        }
        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            nut = "THEM";
            vitri = vattuBindingSource.Position;
            groupBox1.Enabled = true;
            txtMa.Enabled = true;
            vattuBindingSource.AddNew();
            DisableForm();
        }

        private int ktvattu(string mavt)
        {
            int result = 1;
            string lenh = string.Format("EXEC sp_timvattu {0}", mavt);
            using (SqlConnection connection = new SqlConnection(Program.connstr))
            {
                connection.Open();
                SqlCommand sqlcmt = new SqlCommand(lenh, connection);
                sqlcmt.CommandType = CommandType.Text;
                try
                {
                    sqlcmt.ExecuteNonQuery();
                }
                catch
                {
                    result = 0;
                }
                return result;
            }
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (txtMa.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Mã vật tư không được thiếu!", "", MessageBoxButtons.OK);
                txtMa.Focus();
                return;
            }
            if (txtMa.Text.Length > 4)
            {
                MessageBox.Show("Mã vật tư không được quá 4 kí tự !", "", MessageBoxButtons.OK);
                txtMa.Focus();
                return;
            }
            else if (txtMa.Text.Contains(" "))
            {
                MessageBox.Show("Mã vật tư không được chứa khoảng trắng!", "", MessageBoxButtons.OK);
                txtMa.Focus();
                return;
            }
            if (txtMa.Enabled == true)
            {
                try
                {
                    if (ktvattu(txtMa.EditValue.ToString()) == 1)
                    {
                        MessageBox.Show("Mã vật tư không được trùng!", "", MessageBoxButtons.OK);
                        txtMa.Focus();
                        return;
                    }
                }
                catch (Exception ex)
                {
                    //txtMAVT.SelectAll();
                    MessageBox.Show(ex.Message);
                    return;
                }
            }
            if (txtTen.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Tên vật tư không được thiếu !", "", MessageBoxButtons.OK);
                txtTen.Focus();
                return;
            }
            if (txtDVT.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Đơn vị tính không được thiếu!", "", MessageBoxButtons.OK);
                txtDVT.Focus();
                return;
            }
            try
            {
                //Lưu vô dataset
                vattuBindingSource.EndEdit();
                vattuBindingSource.ResetCurrentItem();

                //Lưu vô CSDL
                this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
                this.vattuTableAdapter.Update(this.dataSet.Vattu);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi ghi vật tư.." + ex.Message);
                return;
            }
          
            LoadTable();
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (groupBox1.Enabled)
            {
                if (MessageBox.Show("Dữ liệu Form Vật Tư vẫn chưa lưu vào Database! \nBạn có chắn chắn muốn thoát?", "Thông báo",
                            MessageBoxButtons.OKCancel) == DialogResult.OK)
                {
                    this.Close();
                }
            }
            else
            {
                this.Close();
            }
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            nut = "THEM";
            vitri = vattuBindingSource.Position;
            groupBox1.Enabled = true;
            txtMa.Enabled = false;
            vattuBindingSource.AddNew();
            DisableForm();
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cTDDHBindingSource.Count + cTPNBindingSource.Count + cTPXBindingSource.Count > 0)
            {
                MessageBox.Show("Không thể xóa vật tư này vì đã lập phiếu", "", MessageBoxButtons.OK);
                return;
            }
            else if (MessageBox.Show("Bạn có thật sự muốn xóa vật tư này ???", "Xác nhận", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {
                    vattuBindingSource.RemoveCurrent();
                    this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.vattuTableAdapter.Update(this.dataSet.Vattu);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa vật tư. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    this.vattuTableAdapter.Fill(this.dataSet.Vattu);
                    // bdsVT.Position = bdsVT.Find("MAVT", mavt);
                    return;
                }
            }
        }

        private void btnUndo_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (nut.Equals("THEM"))
            {
                txtMa.Text = txtTen.Text = txtDVT.Text= "";
            }
            else if (nut.Equals("SUA"))
            {
                //vitri = nhanVienBindingSource.Find("MANV",txtMaNV.Text);
                //this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
                //this.nhanVienTableAdapter.Fill(this.dataSet.NhanVien);
            }
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            LoadTable();
        }
    }
}
