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
    public partial class frmPhieuXuat : Form
    {
        private int vitri;
        private String mavt;
        private String mapx;
        private string soluong;
        private string dongia;
        public frmPhieuXuat()
        {
            InitializeComponent();
        }

        private void phieuXuatBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.phieuXuatBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void LoadTable()
        {
            try
            {
                this.dataSet.EnforceConstraints = false;

                this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                this.khoTableAdapter.Fill(this.dataSet.Kho);

                this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPXTableAdapter.Fill(this.dataSet.CTPX);

                this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuXuatTableAdapter.Fill(this.dataSet.PhieuXuat);

                if (Program.mGroup == "CONGTY")
                {
                    btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
                    btnReLoad.Enabled = btnThoat.Enabled = true;
                    panel1.Enabled = true;
                    groupBox1.Enabled = false;
                }
                else
                {
                    btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnReLoad.Enabled = btnThoat.Enabled = true;
                    btnGhi.Enabled = btnUndo.Enabled = false;
                    panel1.Enabled = false;
                    groupBox1.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        private void frmPhieuXuat_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet.DSVT' table. You can move, or remove it, as needed.
            this.dSVTTableAdapter.Fill(this.dataSet.DSVT);
            LoadTable();
            if (Program.mGroup != "CONGTY")
            {
                this.phieuXuatBindingSource.Filter = "MANV='" + Program.username + "'";
            }
            LoadTable();
            cmbCN.DataSource = Program.bds_dspm.DataSource;
            cmbCN.DisplayMember = "TENCN";
            cmbCN.ValueMember = "TENSERVER";
            cmbCN.SelectedIndex = Program.mChinhanh;
            btnGhiCTPX.Enabled = false;
            groupBox1.Enabled = false;
        }
        private void EnableForm()
        {
            btnThem.Enabled = btnXoa.Enabled = btnSua.Enabled = btnReLoad.Enabled = true;
            btnGhi.Enabled = btnUndo.Enabled = false;
        }
        private void DisEnableForm()
        {
            btnThem.Enabled = btnXoa.Enabled = btnSua.Enabled = btnReLoad.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = true;
        }
        private void cmbCN_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbCN.SelectedValue.ToString() == "System.Data.DataRowView")
                return;

            Program.servername = cmbCN.SelectedValue.ToString();

            if (cmbCN.SelectedIndex != Program.mChinhanh)
            {
                Program.mlogin = Program.remotelogin;
                Program.password = Program.remotepassword;
            }
            else
            {
                Program.mlogin = Program.mloginDN;
                Program.password = Program.passwordDN;
            }

            if (Program.KetNoi() == 0)
                MessageBox.Show("Lỗi kết nối về chi nhánh mới", string.Empty, MessageBoxButtons.OK);
            else
            {
                LoadTable();
            }
        }

        private int KiemTraPhieuXuat(string maPX)
        {
            int result = 1;
            string lenh = string.Format("EXEC sp_timphieuxuat {0}", maPX);
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

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            vitri = phieuXuatBindingSource.Position;
            phieuXuatBindingSource.AddNew();
            DisEnableForm();
            groupBox1.Enabled = true;
            txtMaNV.Text = Program.username;
            txtMaNV.Enabled = false;
        }

        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (KiemTraPhieuXuat(txtMaPX.Text) == 1)
            {
                MessageBox.Show("Mã Phiếu Xuất không được trùng !", "", MessageBoxButtons.OK);
                txtMaPX.Focus();
                return;
            }

            if (txtMaPX.Text == string.Empty)
            {
                MessageBox.Show("Mã Phiếu Xuất không được thiếu !", "", MessageBoxButtons.OK);
                txtMaPX.Focus();
                return;
            }

            if (txtMaPX.Text.Length > 8)
            {
                MessageBox.Show("Mã Phiếu Xuất không được hơn 8 ký tự !", "", MessageBoxButtons.OK);
                txtMaPX.Focus();
                return;
            }

            if (txtNgay.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Ngày không được thiếu !", "", MessageBoxButtons.OK);
                return;
            }

            if (txtTenKH.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Họ tên Khách hàng không được thiếu !", "", MessageBoxButtons.OK);
                return;
            }

            try
            {
                phieuXuatBindingSource.EndEdit();
                phieuXuatBindingSource.ResetCurrentItem();

                this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuXuatTableAdapter.Update(this.dataSet.PhieuXuat);

                MessageBox.Show("Ghi thành công!");
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi ghi Phiếu xuất .\n" + ex.Message);
                return;
            }
            EnableForm();
            LoadTable();
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            vitri = phieuXuatBindingSource.Position;
            DisEnableForm();
            groupBox1.Enabled = true;
            txtMaPX.Enabled = txtMaNV.Enabled = false;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cTPXBindingSource.Count > 0)
            {
                MessageBox.Show("Phiếu Xuất đã có Chi Tiết Phiếu xuất nên không thể xóa !", "", MessageBoxButtons.OK);
                return;
            }

            else if (MessageBox.Show("Bạn thực sự muốn xóa ??", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {
                    phieuXuatBindingSource.RemoveCurrent();

                    this.phieuXuatTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.phieuXuatTableAdapter.Update(this.dataSet.PhieuXuat);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa phiếu xuất. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    return;
                }
            }
        }

        private void btnReLoad_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            LoadTable();
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (groupBox1.Enabled)
            {
                if (MessageBox.Show("Dữ liệu Form Phiếu Xuất vẫn chưa lưu vào Database! \nBạn có chắn chắn muốn thoát?", "Thông báo",
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

        //private int ktctpx(string mapx, string mavt)
        //{
        //    int result = 1;
        //    string lenh = string.Format("EXEC sp_timctpx {0},{1}", mapx, mavt);
        //    using (SqlConnection connection = new SqlConnection(Program.connstr))
        //    {
        //        connection.Open();
        //        SqlCommand sqlcmt = new SqlCommand(lenh, connection);
        //        sqlcmt.CommandType = CommandType.Text;
        //        try
        //        {
        //            sqlcmt.ExecuteNonQuery();
        //        }
        //        catch
        //        {
        //            result = 0;
        //        }
        //        return result;
        //    }
        //}

        private void btnThemCTPX_Click(object sender, EventArgs e)
        {
            cTPXBindingSource.AddNew();
            btnGhiCTPX.Enabled = true;
            btnThemCTPX.Enabled = btnXoaCTPX.Enabled = false;
        }

        private void btnXoaCTPX_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thực sự muốn xóa ??", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {

                    cTPXBindingSource.RemoveCurrent();

                    this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTPXTableAdapter.Update(this.dataSet.CTPX);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa chi tiết phiếu xuất. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    return;
                }
            }
        }


        private bool KiemTraVatTuTrenView(string maVT)
        {
            for (int index = 0; index < cTPXBindingSource.Count - 1; index++)
            {
                if (((DataRowView)cTPXBindingSource[index])["MAVT"].ToString().Equals(maVT))
                {
                    return false;
                }
            }
            return true;
        }

        private void btnGhiCTPX_Click(object sender, EventArgs e)
        {
            mavt = ((DataRowView)cTPXBindingSource[cTPXBindingSource.Count - 1])["MAVT"].ToString();
            mapx = ((DataRowView)cTPXBindingSource[cTPXBindingSource.Count - 1])["MAPX"].ToString();
            soluong = ((DataRowView)cTPXBindingSource[cTPXBindingSource.Count - 1])["SOLUONG"].ToString();
            dongia = ((DataRowView)cTPXBindingSource[cTPXBindingSource.Count - 1])["DONGIA"].ToString();
            if (mavt == String.Empty)
            {
                MessageBox.Show("Vật tư không được thiếu!", "", MessageBoxButtons.OK);
                btnThemCTPX.Enabled = false;
                btnXoaCTPX.Enabled = false;
                return;
            }
            if (KiemTraVatTuTrenView(mavt) == false)
            {
                MessageBox.Show("Vật tư không được trùng!", "", MessageBoxButtons.OK);
                //cTPXBindingSource.RemoveCurrent();
                btnThemCTPX.Enabled = false;
                btnXoaCTPX.Enabled = false;
                return;
            }

            if (soluong == string.Empty)
            {
                MessageBox.Show("Số lượng không được thiếu!", "", MessageBoxButtons.OK);
                btnThemCTPX.Enabled = false;
                btnXoaCTPX.Enabled = false;
                return;
            }

            if (dongia == string.Empty)
            {
                MessageBox.Show("Đơn giá không được thiếu!", "", MessageBoxButtons.OK);
                btnThemCTPX.Enabled = false;
                btnXoaCTPX.Enabled = false;
                return;
            }
            
            try
            {
                cTPXBindingSource.EndEdit();
                cTPXBindingSource.ResetCurrentItem();

                MessageBox.Show("Ghi thành công !!!");

                this.cTPXTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPXTableAdapter.Update(this.dataSet.CTPX);
            }
            catch (Exception) { }
            btnThemCTPX.Enabled = true;
            btnXoaCTPX.Enabled = true;
            btnGhiCTPX.Enabled = false;
            LoadTable();
        }
    }
}
