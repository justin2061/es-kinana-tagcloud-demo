#!/bin/bash
NTNAME=chiholee
NTPWD=thxav8d81

export http_proxy=http://$NTNAME:$NTPWD@fetfw.fareastone.com.tw:8080/
export https_proxy=https://$NTNAME:$NTPWD@fetfw.fareastone.com.tw:8080/

curl -XGET 'http://www.president.gov.tw/Default.aspx?tabid=131&itemid=37408&rmid=514' | sed -n '/<td\scolspan="4"\sclass="newscontent">/,/<\/td>/p' | sed 's/<[^>]\+>//g' | tr -d '[[:space:]]' > speak_note.txt

unset http_proxy
unset https_proxy

CONTENT=`cat speak_note.txt`
echo $CONTENT
curl -XDELETE 'http://127.0.0.1:9200/index/fulltext/1'
curl -XPOST 'http://127.0.0.1:9200/index/fulltext/1' -d '{
 "content":"'"$CONTENT"'",
 "datetime":"2016-05-20T00:00:00.000"
}';echo

curl -XGET 'http://127.0.0.1:9200/index/fulltext/1'
 
export http_proxy=http://$NTNAME:$NTPWD@fetfw.fareastone.com.tw:8080/
export https_proxy=https://$NTNAME:$NTPWD@fetfw.fareastone.com.tw:8080/
