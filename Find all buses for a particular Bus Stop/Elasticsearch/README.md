### Procedure
----
#### Step 1. 
POST /stop/stops/_search 

    {
      "query": {
        "match_phrase": {
          "name_stop": "oxford St [northbound] before Quinpool 		Rd"
        }
      },
      "_source": ["stop_id"]
    }



#### Step 2. 
    POST /stoptime/stoptimes/_search
    {
      "query": {
        "match_phrase": {
          "stop_id": "7421"
        }
      },
      "_source": ["trip_id"]
    }
#### Step 3.
    POST /trip/trips/_search
    {
      "query": {
        "match_phrase": {
          "trip_id": "6525322-2012_08A-1208BRwd-Weekday-01"
        }
      },
      "_source": ["trip_headsign"]
    }
