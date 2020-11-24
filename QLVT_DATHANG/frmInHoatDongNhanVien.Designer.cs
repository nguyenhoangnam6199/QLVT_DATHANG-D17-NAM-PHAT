namespace QLVT_DATHANG
{
    partial class frmInHoatDongNhanVien
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
            System.Windows.Forms.Label mã_NVLabel;
            System.Windows.Forms.Label họ_tênLabel;
            this.label1 = new System.Windows.Forms.Label();
            this.dataSet = new QLVT_DATHANG.DataSet();
            this.sp_DSNhanVienBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sp_DSNhanVienTableAdapter = new QLVT_DATHANG.DataSetTableAdapters.sp_DSNhanVienTableAdapter();
            this.tableAdapterManager = new QLVT_DATHANG.DataSetTableAdapters.TableAdapterManager();
            this.txtMaNV = new DevExpress.XtraEditors.SpinEdit();
            this.họ_tênComboBox = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbPhieu = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            mã_NVLabel = new System.Windows.Forms.Label();
            họ_tênLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sp_DSNhanVienBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMaNV.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // mã_NVLabel
            // 
            mã_NVLabel.AutoSize = true;
            mã_NVLabel.Location = new System.Drawing.Point(149, 170);
            mã_NVLabel.Name = "mã_NVLabel";
            mã_NVLabel.Size = new System.Drawing.Size(54, 17);
            mã_NVLabel.TabIndex = 3;
            mã_NVLabel.Text = "Mã NV:";
            // 
            // họ_tênLabel
            // 
            họ_tênLabel.AutoSize = true;
            họ_tênLabel.Location = new System.Drawing.Point(406, 170);
            họ_tênLabel.Name = "họ_tênLabel";
            họ_tênLabel.Size = new System.Drawing.Size(54, 17);
            họ_tênLabel.TabIndex = 5;
            họ_tênLabel.Text = "Họ tên:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Top;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(388, 26);
            this.label1.TabIndex = 0;
            this.label1.Text = "IN HOẠT ĐỘNG CỦA NHÂN VIÊN";
            // 
            // dataSet
            // 
            this.dataSet.DataSetName = "DataSet";
            this.dataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // sp_DSNhanVienBindingSource
            // 
            this.sp_DSNhanVienBindingSource.DataMember = "sp_DSNhanVien";
            this.sp_DSNhanVienBindingSource.DataSource = this.dataSet;
            // 
            // sp_DSNhanVienTableAdapter
            // 
            this.sp_DSNhanVienTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.ChiNhanhTableAdapter = null;
            this.tableAdapterManager.CTDDHTableAdapter = null;
            this.tableAdapterManager.CTPNTableAdapter = null;
            this.tableAdapterManager.CTPXTableAdapter = null;
            this.tableAdapterManager.DatHangTableAdapter = null;
            this.tableAdapterManager.DSNhanVienTableAdapter = null;
            this.tableAdapterManager.DSVTTableAdapter = null;
            this.tableAdapterManager.KhoTableAdapter = null;
            this.tableAdapterManager.NhanVienTableAdapter = null;
            this.tableAdapterManager.PhieuNhapTableAdapter = null;
            this.tableAdapterManager.PhieuXuatTableAdapter = null;
            this.tableAdapterManager.sp_DSNhanVienTableAdapter = this.sp_DSNhanVienTableAdapter;
            this.tableAdapterManager.UpdateOrder = QLVT_DATHANG.DataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            this.tableAdapterManager.VattuTableAdapter = null;
            // 
            // txtMaNV
            // 
            this.txtMaNV.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sp_DSNhanVienBindingSource, "Mã NV", true));
            this.txtMaNV.EditValue = new decimal(new int[] {
            0,
            0,
            0,
            0});
            this.txtMaNV.Location = new System.Drawing.Point(214, 166);
            this.txtMaNV.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtMaNV.Name = "txtMaNV";
            this.txtMaNV.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.txtMaNV.Size = new System.Drawing.Size(156, 24);
            this.txtMaNV.TabIndex = 4;
            // 
            // họ_tênComboBox
            // 
            this.họ_tênComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.sp_DSNhanVienBindingSource, "Họ tên", true));
            this.họ_tênComboBox.DataSource = this.sp_DSNhanVienBindingSource;
            this.họ_tênComboBox.DisplayMember = "Họ tên";
            this.họ_tênComboBox.FormattingEnabled = true;
            this.họ_tênComboBox.Location = new System.Drawing.Point(466, 167);
            this.họ_tênComboBox.Name = "họ_tênComboBox";
            this.họ_tênComboBox.Size = new System.Drawing.Size(228, 24);
            this.họ_tênComboBox.TabIndex = 6;
            this.họ_tênComboBox.ValueMember = "Mã NV";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(104, 218);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 17);
            this.label3.TabIndex = 7;
            this.label3.Text = "Phiếu: ";
            // 
            // cmbPhieu
            // 
            this.cmbPhieu.DisplayMember = "Nhập";
            this.cmbPhieu.FormattingEnabled = true;
            this.cmbPhieu.Items.AddRange(new object[] {
            "Nhập",
            "Xuất"});
            this.cmbPhieu.Location = new System.Drawing.Point(214, 216);
            this.cmbPhieu.Name = "cmbPhieu";
            this.cmbPhieu.Size = new System.Drawing.Size(267, 24);
            this.cmbPhieu.TabIndex = 8;
            this.cmbPhieu.Text = "Nhập";
            this.cmbPhieu.ValueMember = "Nhập";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(109, 291);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(102, 17);
            this.label4.TabIndex = 9;
            this.label4.Text = "Ngày Bắt đầu: ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(479, 296);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(103, 17);
            this.label5.TabIndex = 10;
            this.label5.Text = "Ngày kết thúc: ";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.CustomFormat = "yyyy-MM-dd";
            this.dateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker1.Location = new System.Drawing.Point(246, 291);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(200, 22);
            this.dateTimePicker1.TabIndex = 11;
            this.dateTimePicker1.Value = new System.DateTime(2017, 1, 1, 0, 0, 0, 0);
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.CustomFormat = "yyyy-MM-dd";
            this.dateTimePicker2.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker2.Location = new System.Drawing.Point(588, 291);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(200, 22);
            this.dateTimePicker2.TabIndex = 12;
            this.dateTimePicker2.Value = new System.DateTime(2020, 12, 31, 0, 0, 0, 0);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(174, 359);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(160, 63);
            this.button1.TabIndex = 13;
            this.button1.Text = "Preview";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(398, 359);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(160, 63);
            this.button2.TabIndex = 14;
            this.button2.Text = "Exit";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // frmInHoatDongNhanVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dateTimePicker2);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cmbPhieu);
            this.Controls.Add(this.label3);
            this.Controls.Add(họ_tênLabel);
            this.Controls.Add(this.họ_tênComboBox);
            this.Controls.Add(mã_NVLabel);
            this.Controls.Add(this.txtMaNV);
            this.Controls.Add(this.label1);
            this.Name = "frmInHoatDongNhanVien";
            this.Text = "frmInHoatDongNhanVien";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmInHoatDongNhanVien_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sp_DSNhanVienBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMaNV.Properties)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private DataSet dataSet;
        private System.Windows.Forms.BindingSource sp_DSNhanVienBindingSource;
        private DataSetTableAdapters.sp_DSNhanVienTableAdapter sp_DSNhanVienTableAdapter;
        private DataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private DevExpress.XtraEditors.SpinEdit txtMaNV;
        private System.Windows.Forms.ComboBox họ_tênComboBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbPhieu;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}