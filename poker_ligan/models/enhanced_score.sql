with scores as (
    select *
    from {{ ref('scores') }}
),

tot_nr_players as (
    select event, count(event) as nr_players
    from {{ ref('scores') }}
    group by event
),

final as (
    select 
        tot_nr_players.nr_players,
        scores.event,
        placement,
        INITCAP(LOWER(scores.player)) as player,
        buyins,
        tot_nr_players.nr_players - placement - (buyins/4) + 1 as points
    from scores
    left join tot_nr_players on
        tot_nr_players.event = scores.event
)

select * from final