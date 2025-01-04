-- Chúng ta đang có bộ DB được xây dựng từ các bảng như trong file “5_Create_Test_Database.sql”
-- Hãy chạy script trên để sinh ra các bảng CSDL trong Workbench
-- Từ các bảng đã được sinh ra, hãy viết các câu truy vấn để hoàn thành các yêu cầu đã được đề ra trong file “Exercise.sql”

USE test;


-- 1. Add a primary key to the id fields in the pets and people tables.
ALTER TABLE people
ADD PRIMARY KEY (id);

ALTER TABLE pets
ADD PRIMARY KEY (id);

-- 2. Add a foreign key to the owner_id field in the pets table referencing the id field 
-- in the people table.

ALTER TABLE pets
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id) REFERENCES people(id);

-- 3. Add a column named email to the people table.
ALTER TABLE people
ADD COLUMN email VARCHAR(50);



-- 4. Add a unique constraint to the email column in the people table.
ALTER TABLE people
ADD CONSTRAINT unique_email UNIQUE (email);
-- 5. Rename the name column in the pets table to ‘first_name’.
ALTER TABLE pets 
RENAME COLUMN name TO first_name;
-- 6. Change the postcode data type to CHAR(7) in the addresses table.
ALTER TABLE addresses
MODIFY COLUMN postcode CHAR(7);



