### Procedure
------
#### Step 1.
**POST /stoptime/stoptimes/_search**

    {
      "query": {
        "range": {
          "arrival_time": {
            "gte": "19:00:00",
            "lte": "21:30:00",
            "format": "HH:mm:ss"
          }
        }
      }
    }
#### Step 2.

*POST /trip/trips/_search*

    {
      "query": {
        "match_phrase": {
          "trip_id": "6528747-2012_08A-1208BRsa-Saturday-01"
        }
      },
      "_source": ["trip_headsign"]
    }
