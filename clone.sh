#!/bin/sh
# clone.sh

if [ $# -eq 0 ]; then echo "Usage: clone.sh repo_name ..." >&2; exit 1; fi

for F in "$@"; do :
  f=`basename $F`
  if [ -d "$f" ]; then echo "clone.sh: $F exists" >&2
  else :
    git clone git@github.com:$F.git
  fi
done
  
exit

