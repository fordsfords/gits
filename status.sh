#!/bin/sh
# status.sh

cat <<__EOF__ >gits.tmp1
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
__EOF__

for F in */.git; do :
  D=`dirname $F`
  cd $D
  git status | sed 's/master/main/' >../gits.tmp2
  if diff ../gits.tmp[12] >/dev/null; then :
  else :
    echo $D
    cat ../gits.tmp2
    echo ""
  fi
  cd ..
done

exit
