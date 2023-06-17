WITH scores AS (
    SELECT
        *
    FROM
        {{ ref('scores') }}
),
tot_nr_players AS (
    SELECT
        event,
        COUNT(event) AS nr_players
    FROM
        scores
    GROUP BY
        event
),
FINAL AS (
    SELECT
        tot_nr_players.nr_players,
        scores.event,
        placement,
        INITCAP(LOWER(scores.player)) AS player,
        buyins,
        tot_nr_players.nr_players - placement - (
            buyins / 4
        ) + 1 AS points
    FROM
        scores
        LEFT JOIN tot_nr_players
        ON tot_nr_players.event = scores.event
)
SELECT
    *
FROM
    FINAL
