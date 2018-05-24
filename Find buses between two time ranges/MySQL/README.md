### Procedure
---
#### Query
    select
      distinct trips.trip_headsign
    from
      trips
      inner join stopTimes ON trips.trip_id = stopTimes.trip_id
    where
      stopTimes.arrival_time between "13:00:00"
      AND "14:00:00";
