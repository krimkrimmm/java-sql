-- Lấy ra danh sách các nghề nghiệp (job) duy nhất mà người trong bảng không làm trùng lặp.
SELECT DISTINCT job FROM Person;

-- Lấy ra danh sách các người có nghề nghiệp (job) là ‘Manager’ và lương (salary) lớn hơn 70000.
SELECT fullname, job, salary FROM Person
WHERE job = 'Manager' AND salary > 70000;

-- Lấy ra người có tuổi từ 25 đến 35.
SELECT fullname, job, birthday FROM Person
WHERE YEAR(CURDATE()) - YEAR(birthday) BETWEEN 25 AND 35;

-- Lấy ra danh sách các quốc gia (country) và tổng số lượng người từng quốc gia.
SELECT country, COUNT(*) AS total_people FROM Person
GROUP BY country;

-- Tính số lượng nam (gender = ‘Male’) và nữ (gender = ‘Female’) trong bảng.

SELECT gender, COUNT(*) AS total FROM Person
GROUP BY gender;

-- Lấy ra số lượng người có cùng nghề nghiệp (job) và quốc gia (country).
SELECT job, country, COUNT(*) AS total_people FROM Person
GROUP BY job, country
HAVING COUNT(*) > 1;

-- Lấy ra danh sách người theo thứ tự giảm dần của ngày sinh (birthday).

SELECT fullname, birthday FROM Person
ORDER BY birthday DESC;

-- Lấy ra các nghề nghiệp (job) và tổng số lượng người làm nghề đó, nhưng chỉ hiển thị những nghề nghiệp có ít nhất 3 người làm.
SELECT job, COUNT(*) AS total_people FROM Person
GROUP BY job
HAVING COUNT(*) >= 3;






