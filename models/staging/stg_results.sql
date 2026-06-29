with source as (

    select * from {{ source('raw', 'asa_tournament_results') }}

),

cleaned as (

    select
        -- ids
        tournament_id,
        player_id,

        -- player / tournament info
        player          as player_name,
        tournament_name,
        course,
        season,
        date            as tournament_date,

        -- results
        strokes,
        n_rounds,
        finish          as finish_position,
        made_cut        as made_cut_flag,
        purse,

        -- strokes gained
        sg_ott          as sg_off_tee,
        sg_app          as sg_approach,
        sg_arg          as sg_around_green,
        sg_putt         as sg_putting,
        sg_t2g          as sg_tee_to_green,
        sg_total

    from source

)

select * from cleaned