with results as (

    select * from {{ ref('stg_results') }}

),

players_summary as (

    select
        player_name,
        season,
        count(distinct tournament_id) as tournaments_played,
        sum(made_cut) as cuts_made,
        avg(strokes/n_rounds) as avg_score_per_round,
        avg(nullif(sg_total, 'NA')::float)        as avg_sg_total,
        avg(nullif(sg_off_tee, 'NA')::float)      as avg_sg_off_tee,
        avg(nullif(sg_approach, 'NA')::float)     as avg_sg_approach,
        avg(nullif(sg_around_green, 'NA')::float) as avg_sg_around_green,
        avg(nullif(sg_putting, 'NA')::float)      as avg_sg_putting

    from results
    group by player_name, season

)

select * from players_summary