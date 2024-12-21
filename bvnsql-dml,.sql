-- Tạo một bảng mới có tên “Product” với các trường: “product_id” , “product_name” (varchar), “price” (double) và “quantity” (int).
-- Thêm 10 sản phẩm vào bảng “Product” với thông tin sản phẩm bất kỳ.
-- Thêm một trường “description” (varchar) vào bảng “Product” sau khi đã tạo bảng.
-- Cập nhật giá (price) của sản phẩm có “product_id” là 1 thành 99.
-- Tăng giá của sản phẩm có “product_id” là 2 lên 10%.
-- Dựa vào bảng Person đã import

-- Cập nhật tên của người có id là 10 thành “John Doe”.
-- Đổi quốc gia của người có id là 3 thành “Canada”.
-- Sửa ngày sinh của người có id là 7 thành “1990-05-15” và quốc gia thành Việt Nam.
-- Tăng mức lương của người có id là 40 lên 10%.
-- Giảm lương của những người nào có mức lương trên 6000 xuống 15% --


-- Tạo bảng Product
CREATE TABLE Product 
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    price DOUBLE,
    quantity INT
);

-- Thêm 10 sản phẩm vào bảng Product
INSERT INTO Product (product_name, price, quantity) VALUES
    ('Laptop', 1500.00, 5),
   
   ('Smartphone', 800.00, 10),
    ('Headphones', 150.00, 20),
    ('Mouse', 30.00, 50),
    ('Keyboard', 50.00, 30),
    ('Monitor', 250.00, 15),
    ('Speaker', 100.00, 25),
    ('Router', 80.00, 10),
    ('Webcam', 50.00, 40),
    ('Mousepad', 10.00, 100);
    
-- Thêm trường description vào bảng Product
ALTER TABLE Product ADD description VARCHAR(255);
-- Cập nhật giá của sản phẩm có product_id là 1 thành 99
UPDATE Product SET price = 99.00 WHERE product_id = 1;

-- Tăng giá của sản phẩm có product_id là 2 lên 10%
UPDATE Product SET price = price * 1.10 WHERE product_id = 2;
-- Cập nhật tên của người có id là 10 thành "John Doe"
UPDATE Person SET fullname = 'John Doe' WHERE id = 10;

-- Đổi quốc gia của người có id là 3 thành "Canada"
UPDATE Person SET country = 'Canada' WHERE id = 3;

-- Sửa ngày sinh của người có id là 7 thành "1990-05-15" và quốc gia thành Việt Nam
UPDATE Person SET birthday = '1990-05-15', country = 'Việt Nam' WHERE id = 7;
 
-- Tăng mức lương của người có id là 40 lên 10%
UPDATE Person SET salary = salary * 1.10 WHERE id = 40;
-- Giảm lương của những người nào có mức lương trên 6000 xuống 15%

UPDATE Person SET salary = salary * 0.85 WHERE salary > 6000;
