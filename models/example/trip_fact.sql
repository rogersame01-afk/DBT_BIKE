With TRIPS as (
select
RIDE_ID,
RIDEABLE_TYPE,
DATE(to_timestamp(STARTED_AT)) AS TRIP_DATE,
START_STATIO_ID AS START_STATION_ID,
END_STATION_ID,
MEMBER_CSUAL AS MEMBER_CASUAL,
TIMESTAMPDIFF(SECONDS,to_timestamp(STARTED_AT),to_timestamp(ENDED_AT)) as TRIP_DURATION_SECONDS

from {{ source('demo', 'bike') }}
WHERE RIDE_ID != 'ride_id'

)

select * from TRIPS