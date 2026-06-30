with source as (

    select * from {{ source('raw', 'asa_tournament_results') }}

),

tournaments as (

    select distinct
        tournament_id,
        tournament_name,
        course,
        season,
        date as tournament_date,
        purse
        
    from source

)

select * from tournaments