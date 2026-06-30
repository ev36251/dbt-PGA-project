with source as (

    select * from {{ source('raw', 'asa_tournament_results') }}

),

players as (

    select distinct
        player_id,
        player as player_name

    from source

)

select * from players