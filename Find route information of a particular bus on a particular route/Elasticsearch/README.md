### Procedure
----
#### Step 1.
    POST /stop/stops/_search
    {
      "query": {
        "match_phrase": {
          "name_stop": "oxford St [northbound] before Quinpool Rd"
        }
      },
      "_source": ["stop_id"]
    }
#### Step 2.

**POST /stoptime/stoptimes/_search**

    {
      "query": {
        "match_phrase": {
          "stop_id": "7421"
        }
      },
      "_source": ["stop_sequence"]
    }
#### Step 3.

**POST /stoptime/stoptimes/_search**

    {
      "sort": [{
        "stop_sequence": {
          "order": "asc"
        }
      }],
      "query": {
        "match_phrase": {
          "stop_sequence": "25"
        }
      }
    }
