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
    public partial class frmDatHang : Form
    {
        private int vitri;
        private Stack<String> undoStack = new Stack<string>();
       // private string macn;
        public frmDatHang()
        {
            InitializeComponent();
        }

        private void datHangBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.datHangBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void LoadTable()
        {
            this.dataSet.EnforceConstraints = false;


            this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
            this.datHangTableAdapter.Fill(this.dataSet.DatHang);


            this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
            this.cTDDHTableAdapter.Fill(this.dataSet.CTDDH);


            this.phieuNhapTableAdapter.Connection.ConnectionString = Program.connstr;
            this.phieuNhapTableAdapter.Fill(this.dataSet.PhieuNhap);

            this.khoTableAdapter.Connection.ConnectionString = Program.connstr;
            this.khoTableAdapter.Fill(this.dataSet.Kho);

           
            this.nhanVienTableAdapter.Connection.ConnectionString = Program.connstr;
            this.nhanVienTableAdapter.Fill(this.dataSet.NhanVien);

            this.vattuTableAdapter.Connection.ConnectionString = Program.connstr;
            this.vattuTableAdapter.Fill(this.dataSet.Vattu);

            if (Program.mGroup == "CONGTY")
            {
                btnThem.Enabled = btnXoa.Enabled = btnGhi.Enabled = btnUndo.Enabled = false;
                btnReload.Enabled= btnThoat.Enabled = true;
                groupBox1.Enabled = false;
                groupBox2.Enabled = false;
                panel1.Enabled = true;
                //groupBox3.Enabled = false;
            }
            else
            {
                btnXoa.Enabled = btnReload.Enabled = btnThem.Enabled = btnThoat.Enabled = true;
                btnUndo.Enabled = btnGhi.Enabled = false;
                groupBox1.Enabled = false;
                groupBox2.Enabled = false;
                panel1.Enabled = false;
                //groupBox3.Enabled = false;
            }
        }

        private void DisableForm()
        {
            btnThem.Enabled = btnXoa.Enabled = btnReload.Enabled = false;
            btnGhi.Enabled = btnThoat.Enabled = btnUndo.Enabled = true;
        }
        private void formDatHang_Load(object sender, EventArgs e)
        {
          
            
            LoadTable();
            cmbCN.DataSource = Program.bds_dspm.DataSource;
            cmbCN.DisplayMember = "TENCN";
            cmbCN.ValueMember = "TENSERVER";
            cmbCN.SelectedIndex = Program.mChinhanh;
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

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (groupBox1.Enabled == true || groupBox2.Enabled == true)
            {
                if (MessageBox.Show("Dữ liệu Form vẫn chưa lưu vào Database! \nBạn có chắn chắn muốn thoát?", "Thông báo",
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

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            
            if(MessageBox.Show("Chọn Yes nếu muốn thêm Đơn đặt hàng \nChọn No nếu muốn thêm Chi tiết Đơn đặt hàng ", "BẠN MUỐN THÊM GÌ?", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                groupBox1.Enabled = true;

                //Lệnh giả tự chọn nếu chưa chọn
                //Mã nhân viên
                cmbMaNV.SelectedIndex = 1;
                cmbMaNV.SelectedIndex = 0;

                //Mã Kho
                cmbMaKho.SelectedIndex = 1;
                cmbMaKho.SelectedIndex = 0;

                vitri = datHangBindingSource.Position;
                datHangBindingSource.AddNew();
                String maDDH = txtMaDDH.EditValue.ToString() ;
                String query = "";
                DisableForm();
            }
            else
            {
                groupBox2.Enabled = true;
                //Lệnh giả tự chọn nếu chưa chọn
                cmbMaDDH.SelectedIndex = 1;
                cmbMaDDH.SelectedIndex = 0;

                //Mã vật tư
                cmbVatTu.SelectedIndex = 1;
                cmbVatTu.SelectedIndex = 0;

                vitri = cTDDHBindingSource.Position;
                cTDDHBindingSource.AddNew();
                DisableForm();
            }
        }

        private int ktddh(string maddh)
        {
            int result = 1;
            string lenh = string.Format("EXEC sp_timddh {0}", maddh);
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

        private int ktctddh(string maddh, string mavt)
        {
            int result = 1;
            string lenh = string.Format("EXEC sp_timctddh {0},{1}", maddh,mavt);
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
            //txtMaDDH.Enabled = txtNgay.Enabled = txtNhaCC.Enabled = true;
            if (groupBox1.Enabled == true && groupBox2.Enabled == false)
            {
               
                if(txtMaDDH.Text.Trim() == String.Empty)
                {
                    MessageBox.Show("Mã số đơn đặt hàng không được để trống", "", MessageBoxButtons.OK);
                    txtMaDDH.Focus();
                    return;
                }
                if (txtMaDDH.Text.Length > 8)
                {
                    MessageBox.Show("Mã số đơn đặt hàng không được quá 8 ký tự !", "", MessageBoxButtons.OK);
                    txtMaDDH.Focus();
                    return;
                }
                else if (txtMaDDH.Text.Contains(" "))
                {
                    MessageBox.Show("Mã số đơn đặt hàng không được chứa khoảng trắng!", "", MessageBoxButtons.OK);
                    txtMaDDH.Focus();
                    return;
                }
                if (ktddh(txtMaDDH.EditValue.ToString()) == 1){
                    MessageBox.Show("Mã số đơn đặt hàng đã tồn tại !", "", MessageBoxButtons.OK);
                    txtMaDDH.Focus();
                    return;
                }
                if (txtNgay.Text.Trim() == String.Empty)
                {
                    MessageBox.Show("Ngày lập đơn đặt hàng không được để trống!", "", MessageBoxButtons.OK);
                    txtNgay.Focus();
                    return;
                }
                if(txtNhaCC.Text.Trim() == String.Empty)
                {
                    MessageBox.Show("Nhà cung cấp không được để trống!", "", MessageBoxButtons.OK);
                    txtNhaCC.Focus();
                    return;
                }
                try
                {
                    //Lưu vô dataset
                    datHangBindingSource.EndEdit();
                    datHangBindingSource.ResetCurrentItem();

                    //Lưu vô CSDL
                    this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.datHangTableAdapter.Update(this.dataSet.DatHang);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi ghi đơn đặt hàng.." + ex.Message);
                    return;
                }
                LoadTable();
                groupBox1.Enabled = false;
            }
            else if(groupBox2.Enabled == true && groupBox1.Enabled == false)
            {
                //if(txtSoLuong.EditValue.ToString() == string.Empty)
                //{
                //    MessageBox.Show("Số lượng không được trống !", "", MessageBoxButtons.OK);
                //    txtSoLuong.Focus();
                //    return;
                //}

                //if (txtDonGia.EditValue.ToString() == string.Empty)
                //{
                //    MessageBox.Show("Đơn giá không được trống !", "", MessageBoxButtons.OK);
                //    txtDonGia.Focus();
                //    return;
                //}
                if (int.Parse(txtSoLuong.EditValue.ToString())<= 0)
                {
                    MessageBox.Show("Số lượng không hợp lệ !", "", MessageBoxButtons.OK);
                    txtSoLuong.Focus();
                    return;
                }
                if(int.Parse(txtDonGia.EditValue.ToString()) <= 0)
                {
                    MessageBox.Show("Đơn giá không hợp lệ !", "", MessageBoxButtons.OK);
                    txtDonGia.Focus();
                    return;
                }
                if (ktctddh(cmbMaDDH.SelectedValue.ToString(), cmbVatTu.SelectedValue.ToString()) == 1)
                {
                    MessageBox.Show("Bị trùng khóa !", "", MessageBoxButtons.OK);
                    cmbVatTu.Focus();
                    cmbMaDDH.Focus();
                    return;
                }
                try
                {
                    //Lưu vô dataset
                    cTDDHBindingSource.EndEdit();
                    cTDDHBindingSource.ResetCurrentItem();

                    //Lưu vô CSDL
                    this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTDDHTableAdapter.Update(this.dataSet.CTDDH);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi ghi đơn đặt hàng.." + ex.Message);
                    return;
                }
                LoadTable();
                groupBox2.Enabled = false;
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (MessageBox.Show("Chọn Yes nếu muốn Xóa Đơn đặt hàng \nChọn No nếu muốn xóa chi tiết đơn đặt hàng ", "BẠN MUỐN XÓA GÌ?", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                try
                {
                    //vitri = int.Parse(((DataRowView)datHangBindingSource[datHangBindingSource.Position])["MasoDDH"].ToString());
                    datHangBindingSource.RemoveCurrent();
                    //datHangBindingSource.EndEdit();
                    //datHangBindingSource.ResetCurrentItem();
                    this.datHangTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.datHangTableAdapter.Update(this.dataSet.DatHang);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa dơn đặt hàng. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    this.datHangTableAdapter.Fill(this.dataSet.DatHang);
                    datHangBindingSource.Position = datHangBindingSource.Find("MasoDDH", vitri);
                    return;
                }
                groupBox1.Enabled = true;

                vitri = datHangBindingSource.Position;
                //DisableForm();
            }
            else
            {
                try
                {
                    //vitri = int.Parse(((DataRowView)cTDDHBindingSource[cTDDHBindingSource.Position])["MasoDDH"].ToString());
                    cTDDHBindingSource.RemoveCurrent();
                    //datHangBindingSource.EndEdit();
                    //datHangBindingSource.ResetCurrentItem();
                    this.cTDDHTableAdapter.Connection.ConnectionString = Program.connstr;
                    this.cTDDHTableAdapter.Update(this.dataSet.CTDDH);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi xóa dơn đặt hàng. Bạn hãy xóa lại \n", ex.Message, MessageBoxButtons.OK);
                    this.cTDDHTableAdapter.Fill(this.dataSet.CTDDH);
                    cTDDHBindingSource.Position = cTDDHBindingSource.Find("MasoDDH", vitri);
                    return;
                }
                groupBox1.Enabled = true;

                vitri = cTDDHBindingSource.Position;
                //DisableForm();
            }
        }

        private void btnReload_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            LoadTable();
        }
    }
}
