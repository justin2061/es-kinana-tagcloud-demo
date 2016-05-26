#!/bin/bash
curl -XGET 'http://www.president.gov.tw/Default.aspx?tabid=131&itemid=37408&rmid=514' | sed -n '/<td\scolspan="4"\sclass="newscontent">/,/<\/td>/p' | sed 's/<[^>]\+>//g' > speak_note.txt
