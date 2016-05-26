#!/bin/bash
curl -XGET 'http://127.0.0.1:9200/index/fulltext/1/_termvectors?pretty=true' -d '
{
    "fields" : ["content"],
    "term_statistics" : false,
    "field_statistics" : false,
    "dfs": false,
    "positions": false,
    "offsets": false
}' > index-termvectors.txt
