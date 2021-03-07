#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <folder>"
fi

for DIR in $(find "$1" -path "$1"/.git -prune -o -type d); do
  {
    echo -e '<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>'
    ls -1pa -I.git "$DIR" | grep -v "^\./$" | grep -v "^index\.html$" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
    echo -e '</pre>\n</body>\n</html>'
  } > "$DIR"/index.html
done
