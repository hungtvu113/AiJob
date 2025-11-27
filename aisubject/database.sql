-- ================================
-- BẢNG NGƯỜI DÙNG (bao gồm Quản trị viên)
-- ================================
CREATE TABLE NGUOI_DUNG (
    ma_nguoi_dung INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mat_khau VARCHAR(255) NOT NULL,
    gioi_tinh VARCHAR(10),
    ngay_sinh DATE,
    so_dien_thoai VARCHAR(20),
    vai_tro VARCHAR(50) NOT NULL DEFAULT 'nguoi_dung'
    -- 'nguoi_dung' hoặc 'quan_tri'
);

-- ================================
-- BẢNG HỒ SƠ
-- ================================
CREATE TABLE HO_SO (
    ma_ho_so INT PRIMARY KEY AUTO_INCREMENT,
    ma_nguoi_dung INT NOT NULL,
    loai_tinh_cach VARCHAR(50),
    diem_manh TEXT,
    diem_yeu TEXT,
    so_thich TEXT,
    FOREIGN KEY (ma_nguoi_dung) REFERENCES NGUOI_DUNG(ma_nguoi_dung)
);

-- ================================
-- BÀI TRẮC NGHIỆM
-- ================================
CREATE TABLE BAI_TRAC_NGHIEM (
    ma_bai INT PRIMARY KEY AUTO_INCREMENT,
    ten_bai VARCHAR(100) NOT NULL,
    mo_ta TEXT
);

-- ================================
-- CÂU HỎI
-- ================================
CREATE TABLE CAU_HOI (
    ma_cau_hoi INT PRIMARY KEY AUTO_INCREMENT,
    ma_bai INT NOT NULL,
    noi_dung TEXT NOT NULL,
    FOREIGN KEY (ma_bai) REFERENCES BAI_TRAC_NGHIEM(ma_bai)
);

-- ================================
-- CÂU TRẢ LỜI
-- ================================
CREATE TABLE CAU_TRA_LOI (
    ma_tra_loi INT PRIMARY KEY AUTO_INCREMENT,
    ma_cau_hoi INT NOT NULL,
    noi_dung_tra_loi TEXT NOT NULL,
    diem INT NOT NULL,
    FOREIGN KEY (ma_cau_hoi) REFERENCES CAU_HOI(ma_cau_hoi)
);

-- ================================
-- KẾT QUẢ TRẮC NGHIỆM
-- ================================
CREATE TABLE KET_QUA (
    ma_ket_qua INT PRIMARY KEY AUTO_INCREMENT,
    ma_nguoi_dung INT NOT NULL,
    ma_bai INT NOT NULL,
    tong_diem INT NOT NULL,
    ngay_tao DATE NOT NULL DEFAULT CURRENT_DATE(),
    FOREIGN KEY (ma_nguoi_dung) REFERENCES NGUOI_DUNG(ma_nguoi_dung),
    FOREIGN KEY (ma_bai) REFERENCES BAI_TRAC_NGHIEM(ma_bai)
);

-- ================================
-- NGHỀ NGHIỆP
-- ================================
CREATE TABLE NGHE_NGHIEP (
    ma_nghe INT PRIMARY KEY AUTO_INCREMENT,
    ten_nghe VARCHAR(100) NOT NULL,
    mo_ta TEXT,
    ky_nang_can_thiet TEXT
);

-- ================================
-- GỢI Ý NGHỀ
-- ================================
CREATE TABLE GOI_Y_NGHE (
    ma_goi_y INT PRIMARY KEY AUTO_INCREMENT,
    ma_ket_qua INT NOT NULL,
    ma_nghe INT NOT NULL,
    ti_le_phu_hop INT,
    FOREIGN KEY (ma_ket_qua) REFERENCES KET_QUA(ma_ket_qua),
    FOREIGN KEY (ma_nghe) REFERENCES NGHE_NGHIEP(ma_nghe)
);

-- ================================
-- KHÓA HỌC
-- ================================
CREATE TABLE KHOA_HOC (
    ma_khoa_hoc INT PRIMARY KEY AUTO_INCREMENT,
    ten_khoa_hoc VARCHAR(150) NOT NULL,
    nen_tang VARCHAR(100),
    lien_ket VARCHAR(255),
    ky_nang_lien_quan TEXT
);

-- ================================
-- NGHỀ – KHÓA HỌC
-- ================================
CREATE TABLE NGHE_KHOA_HOC (
    ma_lien_ket INT PRIMARY KEY AUTO_INCREMENT,
    ma_nghe INT NOT NULL,
    ma_khoa_hoc INT NOT NULL,
    FOREIGN KEY (ma_nghe) REFERENCES NGHE_NGHIEP(ma_nghe),
    FOREIGN KEY (ma_khoa_hoc) REFERENCES KHOA_HOC(ma_khoa_hoc)
);
