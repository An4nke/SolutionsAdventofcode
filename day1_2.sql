CREATE TABLE test (
	ID  SERIAL PRIMARY KEY,
	Calorien int,
	elfe int
);

COPY test(Calorien, elfe)
FROM '/tmp/test.csv'
DELIMITER ','
CSV HEADER;

SELECT SUM(calorien),
       elfe
FROM test
GROUP BY elfe
ORDER BY SUM(calorien) DESC;

SELECT SUM(cal) FROM (
	SELECT SUM(calorien) cal,
		   elfe
	FROM test
	GROUP BY elfe
	ORDER BY SUM(calorien) DESC
	LIMIT 3
) a;
