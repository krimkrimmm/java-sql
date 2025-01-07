use sakila;
-- Bài tập 1: Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”
SELECT f.film_id, f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id

WHERE c.name = 'Action';

-- Bài tập 2: Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
SELECT f.film_id, f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- Bài tập 3: Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.

SELECT f.film_id, f.title, COUNT(fc.category_id) AS category_count
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY f.film_id, f.title;

-- Bài tập 4: Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
SELECT f.film_id, f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id

JOIN category c ON fc.category_id = c.category_id
WHERE f.rating = 'PG-13';

-- Bài tập 5: Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id

JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family'
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC;

-- Bài tập 6: Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id

GROUP BY f.film_id, f.title
ORDER BY actor_count DESC;
-- Bài tập 7: Lấy danh sách tất cả diễn viên (actors) có họ là “Smith” và tên bắt đầu bằng “J.”
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Smith' AND first_name LIKE 'J%';
-- Bài tập 8: Lấy danh sách các bộ phim (films) phát hành trong năm 2015 với tổng doanh thu (revenue) lớn hơn 5000.
SELECT film_id, title, revenue
FROM film

WHERE release_year = 2015 AND revenue > 5000;
-- Bài tập 9: Lấy danh sách bộ phim (films) và ngôn ngữ (language) của từng bộ phim.
SELECT f.film_id, f.title, l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id;
-- Bài tập 10. Lấy danh sách bộ phim có tên(title) bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ N 
SELECT film_id, title
FROM film
WHERE title LIKE 'I%N';


