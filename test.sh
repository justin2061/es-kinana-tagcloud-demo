#!/bin/bash
curl -XPUT http://127.0.0.1:9200/index;echo
curl -XPOST http://127.0.0.1:9200/index/fulltext/_mapping -d'
{
    "fulltext": {
             "_all": {
            "analyzer": "mmseg_maxword",
            "search_analyzer": "mmseg_maxword",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "content": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "analyzer": "mmseg_maxword",
                "search_analyzer": "mmseg_maxword",
                "include_in_all": "true",
                "boost": 8
            }
        }
    }
}';echo
