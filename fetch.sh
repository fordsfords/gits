#!/bin/sh
# fetch.sh

for F in */.git; do :
  D=`dirname $F`
  cd $D
  git fetch | sed 's/master/main/' >../gits.tmp
  if [ -s ../gits.tmp ]; then :
    echo $D
    cat ../gits.tmp
    echo ""
  fi
  cd ..
done

exit
