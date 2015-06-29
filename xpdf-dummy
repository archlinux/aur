#!/bin/sh

echo "Someone wanted to invoke 'xpdf'. This invocation was captured by this dummy script:"
echo "  '${0}',"
echo "which does nothing except printing this informational message."
echo ""
echo "There where '${#}' command line arguments passed. The complete command invoked was:"
echo -n "  '${0}' "
while (( ${#} > 0 )); do
  echo -n "'${1}'  "
  shift
done

echo ""
