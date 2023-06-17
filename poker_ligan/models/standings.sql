WITH scores AS (
    SELECT
        *
    FROM
        {{ ref('enhanced_score') }}
),
summed_points AS (
    SELECT
        player,
        SUM(points) AS points,
        ROUND(AVG(placement), 2) AS avg_placement,
        COUNT(*) AS nr_participated
    FROM
        scores
    GROUP BY
        player
),
FINAL AS (
    SELECT
        player,
        avg_placement,
        nr_participated,
        points,
    FROM
        summed_points
    ORDER BY
        points DESC
)
SELECT
    *
FROM
    FINAL
