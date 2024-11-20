#!/bin/sh
# show.sh

for F in */.git; do :
  D=`dirname $F`
  cd $D
  git remote show origin >../gits.tmp1
  sed '/^\* remote origin$/d
       /^  Fetch URL:/d
       /^  Push  URL:/d
       /^  HEAD branch:/d
       /^  Remote branch:/d
       /^  Remote branches:/d
       /^    [./a-zA-Z0-9_-]*  *tracked$/d
       /^  Local branch configured for/d
       /^  Local branches configured for/d
       /^    [./a-zA-Z0-9_-]*  *merges with remote [a-zA-Z0-9_-]*$/d
       /^  Local ref configured for/d
       /^  Local refs configured for/d
       /^    [./a-zA-Z0-9_-]*  *pushes to [a-zA-Z0-9_-]*  *(up to date)$/d' <../gits.tmp1 >../gits.tmp2
  if [ -s ../gits.tmp2 ]; then :
    echo $D
    cat ../gits.tmp2
    echo ""
  fi
  cd ..
done

exit
