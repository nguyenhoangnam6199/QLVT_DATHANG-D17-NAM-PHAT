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
    public partial class frmPhieuNhap : Form
    {
        public frmPhieuNhap()
        {
            InitializeComponent();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void barButtonItem4_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void phieuNhapBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.phieuNhapBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet);

        }

        private void frmPhieuNhap_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet.PhieuNhap' table. You can move, or remove it, as needed.
            this.phieuNhapTableAdapter.Fill(this.dataSet.PhieuNhap);

        }
    }
}
