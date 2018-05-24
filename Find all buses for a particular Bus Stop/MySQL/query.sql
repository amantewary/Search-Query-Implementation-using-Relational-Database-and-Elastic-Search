select
  distinct trips.trip_headsign
from
  trips
  inner join stopTimes ON trips.trip_id = stopTimes.trip_id
  inner join stops on stops.stop_id = stopTimes.stop_id
where
  stops.name_stop like "oxford St [southbound] after Quinpool Rd";