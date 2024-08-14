#!/bin/sh
# gh_ls.sh

TMP="`mktemp`"
PAGE=1
STAT=0

while true; do :
  curl -s -S -H "Authorization: token `cat ~/.ssh/test1_PAT.txt`" "https://api.github.com/user/repos?page=$PAGE&per_page=100" >"$TMP"
  STAT="$?"
  if [ "$STAT" -ne 0 ]; then break; fi

  if egrep -l "{" "$TMP" >/dev/null; then
    cat "$TMP"
  else :
    break;
  fi

  PAGE=$((PAGE + 1))
done >gs_ls.full

if [ "$STAT" -eq 0 ]; then :
  sed -n 's/^ *"full_name": *"\([^"]*\)".*$/\1/p' <gs_ls.full
  rm -f "$TMP"
fi

exit $STAT
