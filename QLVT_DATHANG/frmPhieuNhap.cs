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
    public partial class frmPhieuNhap : Form
    {
        private string mavt;
        private int soluong;
        private string maDDH;
        private int vitri;
        public frmPhieuNhap()
        {
            InitializeComponent();
        }

        private void phieuNhapBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.phieuNhapBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void LoadTable()
        {
            try
            {
                this.dataSet.EnforceConstraints = false;

                this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
                this.khoTableAdapter.Fill(this.dataSet.Kho);

                this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                this.datHangTableAdapter.Fill(this.dataSet.DatHang);

                this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPNTableAdapter.Fill(this.dataSet.CTPN);

                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Fill(this.dataSet.PhieuNhap);

                if (Program.mGroup == "CONGTY")
                {
                    btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
                    btnReload.Enabled = btnThoat.Enabled = true;
                    panel1.Enabled = true;
                    groupBox1.Enabled = false;
                }
                else
                {
                    btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnReload.Enabled = btnThoat.Enabled = true;
                    btnGhi.Enabled = btnUndo.Enabled = false;
                    panel1.Enabled = false;
                    groupBox1.Enabled = true;
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
        private void frmPhieuNhap_Load(object sender, EventArgs e)
        {
            if (Program.mGroup != "CONGTY")
            {
                this.phieuNhapBindingSource.Filter = "MANV='" + Program.username + "'";
                this.datHangBindingSource.Filter= "MANV='" + Program.username + "'";
            }
            LoadTable();
            cmbCN.DataSource = Program.bds_dspm.DataSource;
            cmbCN.DisplayMember = "TENCN";
            cmbCN.ValueMember = "TENSERVER";
            cmbCN.SelectedIndex = Program.mChinhanh;
           // btnGhiCTDDH.Enabled = false;

        }
        private void EnableForm()
        {
            btnThem.Enabled = btnXoa.Enabled = btnSua.Enabled = btnReload.Enabled = true;
            btnGhi.Enabled = btnUndo.Enabled = false;
        }
        private void DisEnableForm()
        {
            btnThem.Enabled = btnXoa.Enabled = btnSua.Enabled = btnReload.Enabled = false;
            btnGhi.Enabled = btnUndo.Enabled = true;
        }
        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            vitri = phieuNhapBindingSource.Position;
            phieuNhapBindingSource.AddNew();
            DisEnableForm();
            txtMaNV.Text = Program.username;
            txtMaNV.Enabled = false;
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

        private int KiemTraPhieuNhap(string maPN)
        {
            int result = 1;
            string lenh = string.Format("EXEC sp_timphieunhap {0}", maPN);
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

        private bool KtraDonDathangTrenView(string maDDH)
        {
            for (int index = 0; index < phieuNhapBindingSource.Count - 1; index++)
            {
                if (((DataRowView)phieuNhapBindingSource[index])["MasoDDH"].ToString().Equals(maDDH))
                {
                    return false;
                }
            }
            return true;
        }
        private void btnGhi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(KiemTraPhieuNhap(txtMaPN.Text) == 1)
            {
                MessageBox.Show("Mã Phiếu Nhập không được trùng !", "", MessageBoxButtons.OK);
                txtMaPN.Focus();
                return;
            }

            if (txtMaPN.Text == string.Empty)
            {
                MessageBox.Show("Mã Phiếu Nhập không được thiếu !", "", MessageBoxButtons.OK);
                txtMaPN.Focus();
                return;
            }

            if (txtMaPN.Text.Length > 8)
            {
                MessageBox.Show("Mã Phiếu Nhập không được hơn 8 ký tự !", "", MessageBoxButtons.OK);
                txtMaPN.Focus();
                return;
            }

            if (txtNgay.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Ngày không được thiếu !", "", MessageBoxButtons.OK);
                return;
            }

            if (cmbDDH.Text == string.Empty)
            {
                MessageBox.Show("Mã Đơn Đặt Hàng không được thiếu !", "", MessageBoxButtons.OK);
                return;
            }

            if (KtraDonDathangTrenView(cmbDDH.Text) == false)
            {
                MessageBox.Show("Đơn Đặt Hàng đã có phiếu nhập !", "", MessageBoxButtons.OK);
                return;
            }

            try
            {
                phieuNhapBindingSource.EndEdit();
                phieuNhapBindingSource.ResetCurrentItem();

                this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                this.phieuNhapTableAdapter.Update(this.dataSet.PhieuNhap);

                MessageBox.Show("Ghi thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi ghi Phiếu nhập .\n" + ex.Message);
                return;
            }
            EnableForm();
            LoadTable();
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            groupBox1.Enabled = true;
            vitri = phieuNhapBindingSource.Position;
            txtMaNV.Enabled = false;
            DisEnableForm();
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (groupBox1.Enabled)
            {
                if (MessageBox.Show("Dữ liệu Form Phiếu Nhập vẫn chưa lưu vào Database! \nBạn có chắn chắn muốn thoát?", "Thông báo",
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

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (cTPNBindingSource.Count > 0)
            {
                MessageBox.Show("Phiếu Nhập đã có Chi Tiết Phiếu Nhập nên không thể xóa !", "", MessageBoxButtons.OK);
                return;
            }

            else if (MessageBox.Show("Bạn thực sự muốn xóa ??", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {
                    phieuNhapBindingSource.RemoveCurrent();

                    this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.phieuNhapTableAdapter.Update(this.dataSet.PhieuNhap);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa phiếu nhập. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    this.phieuNhapTableAdapter.Fill(this.dataSet.PhieuNhap);
                    return;
                }
            }
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            LoadTable();
        }

        private void btnXoaCTPN_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thực sự muốn xóa ??", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                try
                {

                    cTPNBindingSource.RemoveCurrent();

                    this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTPNTableAdapter.Update(this.dataSet.CTPN);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa chi tiết phiếu nhập. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    this.cTPNTableAdapter.Fill(this.dataSet.CTPN);
                    return;
                }
            }
        }

        private int ktSoLuongdathang(string maVT, string maDDH, int sluong)
        {
            int result = 1; // thoa
            string lenh = string.Format("EXEC sp_kiemtraSoLuongNhap {0}, {1}, {2}", maVT, maDDH, sluong);
            using (SqlConnection connection = new SqlConnection(Program.connstr))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(lenh, connection);
                sqlCommand.CommandType = CommandType.Text;
                try
                {
                    sqlCommand.ExecuteNonQuery();
                }
                catch
                {
                    result = 0; // ko thoa
                }
            }
            return result;
        }

        private bool KtraVattuTrenView(string maVT)
        {
            for (int index = 0; index < cTPNBindingSource.Count - 1; index++)
            {
                if (((DataRowView)cTPNBindingSource[index])["MAVT"].ToString().Equals(maVT))
                {
                    return false;
                }
            }
            return true;
        }

        private void btnGhiPN_Click(object sender, EventArgs e)
        {
            mavt = ((DataRowView)cTPNBindingSource[cTPNBindingSource.Count - 1])["MAVT"].ToString();
            maDDH = ((DataRowView)datHangBindingSource[datHangBindingSource.Position])["MasoDDH"].ToString();
            if (mavt == string.Empty)
            {
                MessageBox.Show("Vật tư không thể thiếu ! ", "", MessageBoxButtons.OK);
                return;
            }

            if (KtraVattuTrenView(mavt) == false)
            {
                MessageBox.Show("Vật tư đã được nhập ! ", "", MessageBoxButtons.OK);
                cTPNBindingSource.RemoveCurrent();
                return;
            }

            if (gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "SOLUONG").ToString() == string.Empty)
            {
                MessageBox.Show("Số lượng không thể thiếu! ", "", MessageBoxButtons.OK);
                return;
            }

            soluong = int.Parse((gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "SOLUONG").ToString()));

            if (soluong < 0)
            {
                MessageBox.Show("Số lượng không thể âm ! ", "", MessageBoxButtons.OK);
                return;
            }
            if (ktSoLuongdathang(mavt, maDDH, soluong) == 0)
            {
                MessageBox.Show("Số lượng nhập không được hơn số lượng đặt !", "", MessageBoxButtons.OK);
                return;
            }

            if (gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "DONGIA").ToString() == string.Empty)
            {
                MessageBox.Show("Đơn giá không được thiếu !", "", MessageBoxButtons.OK);
                return;
            }

            try
            {
                cTPNBindingSource.EndEdit();
                cTPNBindingSource.ResetCurrentItem();


                MessageBox.Show("Ghi thành công !!!");

                this.cTPNTableAdapter.Connection.ConnectionString = Program.connstr;
                this.cTPNTableAdapter.Update(this.dataSet.CTPN);
            }
            catch (Exception) { }
            EnableForm();
        }

        private void btnThemCTPN_Click(object sender, EventArgs e)
        {
            cTPNBindingSource.AddNew();
            btnGhiPN.Enabled = true;
            btnThemCTPN.Enabled = btnXoaCTPN.Enabled = false;
        }
    }
}
