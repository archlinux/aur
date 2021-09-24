#!/usr/bin/env bash

RESULT_FILE="$HOME/.config/qalculate/qalc.result.history"
if [ ! -f "$RESULT_FILE" ]; then
  touch $RESULT_FILE
fi

LAST_WOFI=""
QALC_RET=""
while :
do
  qalc_hist=`tac $RESULT_FILE | head -1000`
  WOFI_RET=`wofi --sort-order=default --cache-file=/dev/null -d -p calc <<< "$qalc_hist"`

  rtrn=$?

  if test "$rtrn" = "0"; then
    if [[ "$WOFI_RET" =~ .*=.* ]]; then
      RESULT=`echo "$WOFI_RET" | awk {'print $NF'}`
      wl-copy "$RESULT"
      exit 0
    else
      QALC_RET=`qalc "$WOFI_RET"`
      LAST_WOFI=$WOFI_RET
      echo $QALC_RET >> $RESULT_FILE
    fi
  else
    if [ ! -z "$LAST_WOFI" ]; then
      RESULT=`qalc -t "$LAST_WOFI"`
      wl-copy "$RESULT"
    fi
    exit 0
  fi
done
