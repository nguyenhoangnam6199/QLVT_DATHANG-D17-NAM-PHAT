using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLVT_DATHANG.BaoCao
{
    public partial class Report_SP_DSVatTu : DevExpress.XtraReports.UI.XtraReport
    {
        public Report_SP_DSVatTu()
        {
            InitializeComponent();
            this.sqlDataSource1.Connection.ConnectionString = Program.connstr;
            this.sqlDataSource1.Fill();
        }

    }
}
