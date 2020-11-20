using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLVT_DATHANG.BaoCao
{
    public partial class Report_SP_HDNV : DevExpress.XtraReports.UI.XtraReport
    {
        public Report_SP_HDNV(int manv, string loai, string bd, string kt)
        {
            InitializeComponent();
            this.sqlDataSource1.Queries[0].Parameters[0].Value = manv;
            this.sqlDataSource1.Queries[0].Parameters[1].Value = loai;
            this.sqlDataSource1.Queries[0].Parameters[2].Value = bd;
            this.sqlDataSource1.Queries[0].Parameters[3].Value = kt;
            this.sqlDataSource1.Fill();
        }

    }
}
