SELECT
	J.JOB_TITLE Cargo,
	ROUND(AVG(E.SALARY), 2) `Média salarial`,
	CASE
		WHEN (AVG(E.SALARY) >= 2000) AND (AVG(E.SALARY) <= 5800) THEN 'Júnior'
        WHEN (AVG(E.SALARY) >= 5801) AND (AVG(E.SALARY) <= 7500) THEN 'Pleno'
        WHEN (AVG(E.SALARY) >= 7501) AND (AVG(E.SALARY) <= 10500) THEN 'Sênior'
        WHEN (AVG(E.SALARY) > 10500) THEN 'CEO'
        ELSE ''
	END AS `Senioridade`
FROM jobs J
INNER JOIN employees E
ON J.JOB_ID = E.JOB_ID
GROUP BY E.JOB_ID
ORDER BY `Média salarial`, Cargo;