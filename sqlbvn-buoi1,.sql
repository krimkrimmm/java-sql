-- Tạo 1 bảng Person với các thông tin sau:
-- id: kiểu số nguyên,
-- fullname: chữ,
-- job: chữ,
-- birthday: ngày/tháng/năm,
-- salary: kiểu số,

-- address: chữ.
-- Thêm 10 bản ghi vào bảng trên.
 
-- Tạo cơ sở dữ liệu
CREATE DATABASE my_database;
-- Sử dụng cơ sở dữ liệu
USE my_database;
-- Tạo bảng Person
CREATE TABLE Person 
(
    id INT PRIMARY KEY,
    fullname VARCHAR(255),
    job VARCHAR(100),
    birthday DATE,
    salary DECIMAL(10, 2),
    address VARCHAR(255)
);
-- Thêm 10 bản ghi vào bảng Person
INSERT INTO Person (id, fullname, job, birthday, salary, address)

VALUES
(1, 'Nguyễn Văn A', 'Kỹ sư phần mềm', '1990-01-15', 15000000, 'Hà Nội'),
(2, 'Trần Thị B', 'Giáo viên', '1985-03-22', 12000000, 'Hải Phòng'),
(3, 'Lê Văn C', 'Bác sĩ', '1988-07-10', 20000000, 'TP Hồ Chí Minh'),
(4, 'Phạm Thị D', 'Nhân viên kinh doanh', '1992-11-05', 18000000, 'Đà Nẵng'),
(5, 'Hoàng Văn E', 'Kế toán', '1995-06-18', 14000000, 'Hải Dương'),
(6, 'Đặng Văn G', 'Nhân viên hành chính', '1990-04-09', 13000000, 'Huế'),
(7, 'Ngô Văn H', 'Lập trình viên', '1993-02-20', 17000000, 'Cần Thơ'),
(8, 'Vũ Thị I', 'Quản lý dự án', '1987-09-25', 22000000, 'Nha Trang'),

(9, 'Phan Văn K', 'Thiết kế đồ họa', '1991-12-30', 16000000, 'Bình Dương'),
(10, 'Trịnh Thị L', 'Kỹ thuật viên', '1989-08-14', 14500000, 'Quảng Ninh');
 