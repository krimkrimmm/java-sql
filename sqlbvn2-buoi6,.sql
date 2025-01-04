use sakila
-- Lấy danh sách tên các diễn viên (actors) có họ bắt đầu bằng chữ “S”.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'S%';


-- Lấy danh sách các bộ phim (films) được phát hành trong khoảng từ năm 2000 đến năm 2010.
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2000 AND 2010;

-- Lấy danh sách các bộ phim (films) có rating là “PG” hoặc “PG-13”.
SELECT title, rating
FROM film
WHERE rating IN ('PG', 'PG-13');

-- Lấy danh sách diễn viên (actors) và số lượng bộ phim (films) mà họ tham gia, sắp xếp theo số lượng bộ phim giảm dần.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC;

-- Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
SELECT f.title, c.name AS category

FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title

ORDER BY actor_count DESC;

-- Lấy danh sách các diễn viên (actors) có số lượng bộ phim (films) tham gia lớn hơn 30.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 30;


-- Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;

-- Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
SELECT f.title, SUM(s.revenue) AS total_revenue
FROM film f
JOIN sales s ON f.film_id = s.film_id
GROUP BY f.film_id, f.title
ORDER BY total_revenue DESC;

-- Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror” 
SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Horror';


     