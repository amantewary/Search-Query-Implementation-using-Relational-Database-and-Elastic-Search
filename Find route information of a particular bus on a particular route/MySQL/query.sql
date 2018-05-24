select
  distinct stopTimes.stop_id,
  stops.name_stop,
  stopTimes.stop_sequence
from
  stopTimes
  inner join (
    select
      trip_id
    from
      trips
    where
      route_id = '14-114'
      and trip_headsign = '14 DOWNTOWN'
  ) trips on stopTimes.trip_id = trips.trip_id
  inner join stops on stopTimes.stop_id = stops.stop_id
order by
  stopTimes.stop_sequence;