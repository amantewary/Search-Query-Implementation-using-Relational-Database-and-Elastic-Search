### Procedure
------
#### Step 1.
**POST /stoptime/stoptimes/_search**

    {
      "size": 0,
      "aggs": {
        "counts_stop_id": {
          "terms": {
            "field": "stop_id",
            "order": {
              "_count": "desc"
            },
            "size": 3
          }
        }
      }
    }

#### Step 2.

**POST /stop/stops/_search**

    {
      "query": {
        "match_phrase": {
          "stop_id": "8643"
        }
      },
      "_source": ["name_stop"]

#### Step 3.

**POST /stop/stops/_search**

      {
        "query": {
          "match_phrase": {
            "stop_id": "6105"
          }
        },
        "_source": ["name_stop"]
      }
  #### Steps 4.
  
  **POST /stop/stops/_search**
  
      {
        "query": {
          "match_phrase": {
            "stop_id": "6108"
          }
        },
        "_source": ["name_stop"]
      }