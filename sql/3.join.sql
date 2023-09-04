-- 1번 유저가 작성한 모든 점수(score)
-- 일단 movies_
-- JOIN: 테이블을 합쳐줌 
-- ON : 기준점, score 테이블에 user_id와 user 테이블의 id가 같기 때문에 
-- WHERE 절로 filtering 을 걸어서 원하는 데이터만 출력 
-- SELECT * FROM movies_user

-- JOIN movies_score ON movies_user.id = movies_score.user_id

-- WHERE movies_user.id=1;

-- orm코드
-- Score.objects.filter(user_id=1)
-- User.objects.get(id=1).score_set.all()






-- 1번 영화의 카테고리 
-- movies_movie 와 movies_category_movies 를 교집합 movies_movie와 movies_category를 교집합
-- movies_movie.id 는 movies_category_movies.movie_id와 같은 값을 갖게 될 것
-- where 절을 활용하여 1번 무비의 데이터들만 가져옴

-- SELECT * FROM movies_movie
-- JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category_movies.category_id = movies_category.id
-- WHERE movies_movie.id=1;

-- Movie.objects.get(id=1).categories.all()


-- 1번 유저가 작성한 모든 점수의 평균
-- SELECT AVG(value) FROM movies_user
-- JOIN movies_score ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id=1;

-- ORM
-- User.objects.get(id=1).score_set.all().aggregate(Avg('value'))
-- Score.objects.filter(user_id=1).aggregate(Avg('value'))

-- drama 카테고리에 속한 모든 영화
-- SELECT * FROM movies_category
-- JOIN movies_category_movies ON movies_category.id=movies_category_movies.category_id
-- JOIN movies_movie ON movies_category_movies.movie_id=movies_movie.id
-- WHERE movies_category.id=1;

-- SELECT * FROM movies_movie
-- JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category.id = movies_category_movies.category_id
-- WHERE movies_category.name = 'drama'

-- -> 여기까지 필기 옮긴듯

-- 기본 GROUP BY
-- 나라별로 groupby 해서 user 명수 
-- SELECT country, COUNT(*) FROM movies_user
-- GROUP BY country;
-- orm 
-- User.objects.values('country').annotate(Count('id'))


-- 나라별 점수 평균
SELECT country, COUNT(*), AVG(value) FROM movies_user
JOIN movies_score ON movies_user.id = movies_score.user_id
-- --이렇게 만들어진 테이블에서 그룹바이
GROUP BY country;
--orm
-- User.objects.values('country').annotate(Count('id'), Avg('score__value'))
-- score라는 테이블의 value값을 가져와서 평균을 구한다는 의미 




