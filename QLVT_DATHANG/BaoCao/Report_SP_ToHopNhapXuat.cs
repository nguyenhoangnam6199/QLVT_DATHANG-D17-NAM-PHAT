using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLVT_DATHANG.BaoCao
{
    public partial class Report_SP_ToHopNhapXuat : DevExpress.XtraReports.UI.XtraReport
    {
        public Report_SP_ToHopNhapXuat(string quyen, string bd, string kt)
        {
            InitializeComponent();
            this.sqlDataSource1.Connection.ConnectionString = Program.connstr;
            this.sqlDataSource1.Queries[0].Parameters[0].Value = bd;
            this.sqlDataSource1.Queries[0].Parameters[1].Value = kt;
            this.sqlDataSource1.Queries[0].Parameters[2].Value = quyen;
            this.sqlDataSource1.Fill();
        }

    }
}
