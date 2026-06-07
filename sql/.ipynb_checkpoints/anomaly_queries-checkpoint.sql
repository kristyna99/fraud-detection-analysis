-- 1. Celkový přehled
SELECT 
    Class,
    COUNT(*) AS pocet,
    ROUND(AVG(Amount), 2) AS prumer_amount,
    ROUND(MAX(Amount), 2) AS max_amount
FROM transactions
GROUP BY Class;

-- 2. Transakce výrazně nad průměrem (Z-score > 3)
SELECT
    Time,
    Amount,
    Class,
    ROUND((Amount - AVG(Amount) OVER()) / 
          NULLIF(STDDEV(Amount) OVER(), 0), 2) AS z_score
FROM transactions
WHERE ABS((Amount - AVG(Amount) OVER()) / 
          NULLIF(STDDEV(Amount) OVER(), 0)) > 3
ORDER BY Amount DESC
LIMIT 20;

-- 3. Fraud rate dle pásma Amount
SELECT
    CASE
        WHEN Amount < 10 THEN '< 10'
        WHEN Amount < 100 THEN '10–100'
        WHEN Amount < 1000 THEN '100–1000'
        ELSE '1000+'
    END AS pasmo,
    COUNT(*) AS celkem,
    SUM(Class) AS fraud_count,
    ROUND(100.0 * SUM(Class) / COUNT(*), 3) AS fraud_pct
FROM transactions
GROUP BY 1
ORDER BY fraud_pct DESC;