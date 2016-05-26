#!/bin/bash
curl -XPOST 'http://127.0.0.1:9200/_search' -d '{
"query": {
        "query_string": {
           "query": "content:民主"
        }
    }
}'
