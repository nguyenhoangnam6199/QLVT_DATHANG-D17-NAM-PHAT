namespace QLVT_DATHANG
{
    partial class frmTaoLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label maNVLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmTaoLogin));
            System.Windows.Forms.Label hotenLabel;
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnThoat = new System.Windows.Forms.Button();
            this.btnTaoLogin = new System.Windows.Forms.Button();
            this.rdUser = new System.Windows.Forms.RadioButton();
            this.rdCN = new System.Windows.Forms.RadioButton();
            this.rdCT = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.dSNhanVienBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet = new QLVT_DATHANG.DataSet();
            this.txtUsername = new DevExpress.XtraEditors.SpinEdit();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtLoginName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dSNhanVienTableAdapter = new QLVT_DATHANG.DataSetTableAdapters.DSNhanVienTableAdapter();
            this.tableAdapterManager = new QLVT_DATHANG.DataSetTableAdapters.TableAdapterManager();
            this.cmbHoTen = new System.Windows.Forms.ComboBox();
            this.dSNhanVienGridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colMaNV = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colHoten = new DevExpress.XtraGrid.Columns.GridColumn();
            maNVLabel = new System.Windows.Forms.Label();
            hotenLabel = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dSNhanVienBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUsername.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSNhanVienGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // maNVLabel
            // 
            maNVLabel.AutoSize = true;
            maNVLabel.Location = new System.Drawing.Point(146, 218);
            maNVLabel.Name = "maNVLabel";
            maNVLabel.Size = new System.Drawing.Size(81, 17);
            maNVLabel.TabIndex = 4;
            maNVLabel.Text = "Username: ";
            // 
            // groupBox1
            // 
            this.groupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("groupBox1.BackgroundImage")));
            this.groupBox1.Controls.Add(this.dSNhanVienGridControl);
            this.groupBox1.Controls.Add(hotenLabel);
            this.groupBox1.Controls.Add(this.cmbHoTen);
            this.groupBox1.Controls.Add(this.btnThoat);
            this.groupBox1.Controls.Add(this.btnTaoLogin);
            this.groupBox1.Controls.Add(this.rdUser);
            this.groupBox1.Controls.Add(this.rdCN);
            this.groupBox1.Controls.Add(this.rdCT);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(maNVLabel);
            this.groupBox1.Controls.Add(this.txtUsername);
            this.groupBox1.Controls.Add(this.txtPassword);
            this.groupBox1.Controls.Add(this.txtLoginName);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1076, 519);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // btnThoat
            // 
            this.btnThoat.Location = new System.Drawing.Point(442, 370);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(122, 56);
            this.btnThoat.TabIndex = 13;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnTaoLogin
            // 
            this.btnTaoLogin.Location = new System.Drawing.Point(229, 370);
            this.btnTaoLogin.Name = "btnTaoLogin";
            this.btnTaoLogin.Size = new System.Drawing.Size(141, 56);
            this.btnTaoLogin.TabIndex = 12;
            this.btnTaoLogin.Text = "Tạo Tài Khoản";
            this.btnTaoLogin.UseVisualStyleBackColor = true;
            this.btnTaoLogin.Click += new System.EventHandler(this.btnTaoLogin_Click);
            // 
            // rdUser
            // 
            this.rdUser.AutoSize = true;
            this.rdUser.Location = new System.Drawing.Point(552, 275);
            this.rdUser.Name = "rdUser";
            this.rdUser.Size = new System.Drawing.Size(67, 21);
            this.rdUser.TabIndex = 11;
            this.rdUser.TabStop = true;
            this.rdUser.Text = "USER";
            this.rdUser.UseVisualStyleBackColor = true;
            // 
            // rdCN
            // 
            this.rdCN.AutoSize = true;
            this.rdCN.Location = new System.Drawing.Point(406, 275);
            this.rdCN.Name = "rdCN";
            this.rdCN.Size = new System.Drawing.Size(104, 21);
            this.rdCN.TabIndex = 10;
            this.rdCN.TabStop = true;
            this.rdCN.Text = "CHI NHANH";
            this.rdCN.UseVisualStyleBackColor = true;
            // 
            // rdCT
            // 
            this.rdCT.AutoSize = true;
            this.rdCT.Location = new System.Drawing.Point(287, 275);
            this.rdCT.Name = "rdCT";
            this.rdCT.Size = new System.Drawing.Size(92, 21);
            this.rdCT.TabIndex = 9;
            this.rdCT.TabStop = true;
            this.rdCT.Text = "CONG TY";
            this.rdCT.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(182, 273);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(45, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "Role: ";
            // 
            // dSNhanVienBindingSource
            // 
            this.dSNhanVienBindingSource.DataMember = "DSNhanVien";
            this.dSNhanVienBindingSource.DataSource = this.dataSet;
            // 
            // dataSet
            // 
            this.dataSet.DataSetName = "DataSet";
            this.dataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // txtUsername
            // 
            this.txtUsername.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.dSNhanVienBindingSource, "MaNV", true));
            this.txtUsername.EditValue = new decimal(new int[] {
            0,
            0,
            0,
            0});
            this.txtUsername.Location = new System.Drawing.Point(245, 211);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.txtUsername.Size = new System.Drawing.Size(125, 24);
            this.txtUsername.TabIndex = 5;
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(245, 155);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(222, 22);
            this.txtPassword.TabIndex = 3;
            // 
            // txtLoginName
            // 
            this.txtLoginName.Location = new System.Drawing.Point(245, 96);
            this.txtLoginName.Name = "txtLoginName";
            this.txtLoginName.Size = new System.Drawing.Size(222, 22);
            this.txtLoginName.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(150, 155);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Password: ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(135, 99);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(92, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Login Name: ";
            // 
            // dSNhanVienTableAdapter
            // 
            this.dSNhanVienTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.ChiNhanhTableAdapter = null;
            this.tableAdapterManager.CTDDHTableAdapter = null;
            this.tableAdapterManager.CTPNTableAdapter = null;
            this.tableAdapterManager.CTPXTableAdapter = null;
            this.tableAdapterManager.DatHangTableAdapter = null;
            this.tableAdapterManager.DSNhanVienTableAdapter = this.dSNhanVienTableAdapter;
            this.tableAdapterManager.KhoTableAdapter = null;
            this.tableAdapterManager.NhanVienTableAdapter = null;
            this.tableAdapterManager.PhieuNhapTableAdapter = null;
            this.tableAdapterManager.PhieuXuatTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = QLVT_DATHANG.DataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            this.tableAdapterManager.VattuTableAdapter = null;
            // 
            // hotenLabel
            // 
            hotenLabel.AutoSize = true;
            hotenLabel.Location = new System.Drawing.Point(426, 215);
            hotenLabel.Name = "hotenLabel";
            hotenLabel.Size = new System.Drawing.Size(53, 17);
            hotenLabel.TabIndex = 13;
            hotenLabel.Text = "Name: ";
            // 
            // cmbHoTen
            // 
            this.cmbHoTen.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.dSNhanVienBindingSource, "Hoten", true));
            this.cmbHoTen.FormattingEnabled = true;
            this.cmbHoTen.Location = new System.Drawing.Point(482, 212);
            this.cmbHoTen.Name = "cmbHoTen";
            this.cmbHoTen.Size = new System.Drawing.Size(189, 24);
            this.cmbHoTen.TabIndex = 14;
            this.cmbHoTen.SelectedIndexChanged += new System.EventHandler(this.cmbHoTen_SelectedIndexChanged);
            // 
            // dSNhanVienGridControl
            // 
            this.dSNhanVienGridControl.DataSource = this.dSNhanVienBindingSource;
            this.dSNhanVienGridControl.Dock = System.Windows.Forms.DockStyle.Right;
            this.dSNhanVienGridControl.Location = new System.Drawing.Point(694, 18);
            this.dSNhanVienGridControl.MainView = this.gridView1;
            this.dSNhanVienGridControl.Name = "dSNhanVienGridControl";
            this.dSNhanVienGridControl.Size = new System.Drawing.Size(379, 498);
            this.dSNhanVienGridControl.TabIndex = 14;
            this.dSNhanVienGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            // 
            // gridView1
            // 
            this.gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colMaNV,
            this.colHoten});
            this.gridView1.GridControl = this.dSNhanVienGridControl;
            this.gridView1.Name = "gridView1";
            // 
            // colMaNV
            // 
            this.colMaNV.FieldName = "MaNV";
            this.colMaNV.MinWidth = 25;
            this.colMaNV.Name = "colMaNV";
            this.colMaNV.Visible = true;
            this.colMaNV.VisibleIndex = 0;
            this.colMaNV.Width = 94;
            // 
            // colHoten
            // 
            this.colHoten.FieldName = "Hoten";
            this.colHoten.MinWidth = 25;
            this.colHoten.Name = "colHoten";
            this.colHoten.Visible = true;
            this.colHoten.VisibleIndex = 1;
            this.colHoten.Width = 94;
            // 
            // frmTaoLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1076, 519);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmTaoLogin";
            this.Text = "frmTaoLogin";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmTaoLogin_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dSNhanVienBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtUsername.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSNhanVienGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtLoginName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private DataSet dataSet;
        private System.Windows.Forms.BindingSource dSNhanVienBindingSource;
        private DataSetTableAdapters.DSNhanVienTableAdapter dSNhanVienTableAdapter;
        private DataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.RadioButton rdUser;
        private System.Windows.Forms.RadioButton rdCN;
        private System.Windows.Forms.RadioButton rdCT;
        private System.Windows.Forms.Label label3;
        private DevExpress.XtraEditors.SpinEdit txtUsername;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.Button btnTaoLogin;
        private System.Windows.Forms.ComboBox cmbHoTen;
        private DevExpress.XtraGrid.GridControl dSNhanVienGridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn colMaNV;
        private DevExpress.XtraGrid.Columns.GridColumn colHoten;
    }
}