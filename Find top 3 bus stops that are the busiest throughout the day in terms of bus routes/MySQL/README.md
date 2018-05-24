### Procedure
---
#### Query

    select
      k.name_stop,
      count(k.route_id) as m
    from
      (
        select
          s.stop_id,
          s.name_stop,
          t.route_id
        from
          stops s
          inner join stopTimes st on s.stop_id = st.stop_id
          inner join trips t on st.trip_id = t.trip_id
      ) k
    group by
      k.stop_id
    order by
      m desc
    limit
      3;