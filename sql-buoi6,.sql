-- Bài Tập 1:
-- Chúng ta áp dụng các hàm SUM, COUNT, AVG, MIN, MAX vào các ví dụ sau. Yêu cầu sử dụng các bảng trong database sakila:
-- Tính số lượng bản ghi ở bảng actor
-- Xác định thời lượng dài nhất và ngắn nhất của các bộ phim trong bảng film
-- Có bao nhiêu bộ phim có rating = R ?
-- Trung bình rental_rate của các bộ phim dài hơn 60 phút ?

-- Bài Tập 2: Hãy trả lời các câu hỏi sau:
-- Khi sử dụng hàm COUNT trong MySQL, nó trả về gì?
-- a) Tổng của các giá trị trong cột
-- b) Số lượng hàng trong kết quả truy vấn
-- c) Giá trị trung bình của các hàng
-- d) Giá trị nhỏ nhất trong cột
-- Để tính giá trị trung bình của một cột trong MySQL, bạn sử dụng hàm nào?
-- a) SUM
-- b) COUNT

-- c) AVG
-- d) MIN
-- Hàm MAX trong MySQL được sử dụng để làm gì?
-- a) Trả về tổng giá trị của các hàng trong cột
-- b) Trả về số lượng hàng trong cột
-- c) Trả về giá trị lớn nhất trong cột
-- d) Trả về giá trị nhỏ nhất trong cột
-- Khi bạn muốn tìm giá trị nhỏ nhất trong một cột cụ thể trong MySQL, bạn sử dụng hàm nào?
-- a) SUM

-- b) COUNT
-- c) AVG
-- d) MIN
-- Hàm SUM trong MySQL thường được sử dụng để tính tổng của các giá trị trong cột nào?
-- a) Cột chứa các giá trị số nguyên
-- b) Cột chứa các giá trị văn bản
-- c) Cột chứa các giá trị ngày tháng
-- d) Cột chứa các giá trị NULL


-- Bài Tập 1:
-- 1. Tính số lượng bản ghi ở bảng actor
SELECT COUNT(*) FROM actor;

-- 2. Xác định thời lượng dài nhất và ngắn nhất của các bộ phim trong bảng film
SELECT MAX(length) AS max_length, MIN(length) AS min_length FROM film;

-- 3. Có bao nhiêu bộ phim có rating = 'R'?
SELECT COUNT(*) FROM film WHERE rating = 'R';

-- 4. Trung bình rental_rate của các bộ phim dài hơn 60 phút?
SELECT AVG(rental_rate) FROM film WHERE length > 60;
-- Bài Tập 2:
-- Câu hỏi 1: Khi sử dụng hàm COUNT trong MySQL, nó trả về gì?
-- Đáp án: b) Số lượng hàng trong kết quả truy vấn

-- Câu hỏi 2: Để tính giá trị trung bình của một cột trong MySQL, bạn sử dụng hàm nào?
-- Đáp án: c) AVG


-- Câu hỏi 3: Hàm MAX trong MySQL được sử dụng để làm gì?
-- Đáp án: c) Trả về giá trị lớn nhất trong cột

-- Câu hỏi 4: Khi bạn muốn tìm giá trị nhỏ nhất trong một cột cụ thể trong MySQL, bạn sử dụng hàm nào?
-- Đáp án: d) MIN

-- Câu hỏi 5: Hàm SUM trong MySQL thường được sử dụng để tính tổng của các giá trị trong cột nào?
-- Đáp án: a) Cột chứa các giá trị số nguyên



