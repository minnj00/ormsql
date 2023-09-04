-- -- User.objects.filter(age=41) 
-- SELECT * FROM movies_user
-- WHERE age=41;

-- -- Movie.objects.filer(year__gt=2000)
-- SELECT * FROM movies_movie
-- WHERE year > 2000;


-- Movie.objects.filter(year__gt=2000, year__lt=2010)
-- SELECT * FROM movies_movie
-- WHERE year > 2000 AND year <2010;


-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
-- SELECT * FROM movies_movie
-- WHERE year < 2000 OR year > 2010;

-- User.objects.exclude(age__gt=30)
-- SELECT * FROM movies_user
-- WHERE NOT age > 30;

-- Movie.objects.aggregate(Min('year'))
-- SELECT MIN(year) FROM movies_movie;

-- Movie.objects.aggregate(Max('year'))
-- SELECT MAX(year) FROM movies_movie;

-- Score.objects.filter(movie_id=1).aggregate(Min('value'), Max('value'))
-- SELECT MAX(value), MIN(value)
-- FROM movies_score 
-- WHERE movie_id=1

-- Movie.objects.count()
-- SELECT COUNT(*) FROM movies_movie;


-- Movie.objects.filter(year__gt=2000).count()
-- SELECT COUNT(*)
-- From movies_movie
-- WHERE year > 2000;


-- - country 를 셀거다 movies_user에 있는 
-- - 중복되지 않게 출력하려면 DISTINCT 를 붙임
-- SELECT COUNT(DISTINCT country)
-- FROM movies_user;
-- User.objects.values('country').distinct().count()


-- SELECT SUM(year) FROM movies_movie;

-- SELECT SUM(value)
-- FROM movies_score
-- WHERE movie_id=10;

-- SELECT AVG(year) FROM movies_movie;

-- SELECT AVG(value) 
-- FROM movies_score
-- WHERE movie_id=10;


-- Score.objects.filter(value__gt=avg['value__avg'])
-- SELECT * FROM movies_score
-- WHERE value > (SELECT AVG(value) FROM movies_score)


-- SELECT * FROM movies_movie
-- WHERE title LIKE '%the%';

-- SELECT * FROM movies_movie
-- WHERE title LIKE 'the%';

-- SELECT * FROM movies_movie
-- WHERE title LIKE '%on.';

-- ORM 정규표현식을 사용하기 위한 코드
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%g__d%';

-- Movie.objects.filter(year__in=[2002, 2001, 2002])
-- SELECT * FROM movies_movie
-- WHERE year IN (2000, 2001, 2002);

-- User.objects.filter(age__range=[20,30])
-- SELECT * FROM movies_user
-- WHERE age BETWEEN 20 AND 30;

-- UPDATE movies_actor
-- SET age=100
-- WHERE id BETWEEN 1 AND 10;

SELECT * FROM movies_actor;