#!/bin/sh

. /usr/share/remoteit/functions.sh

parse_command() {
  local cmd=$1

  case $cmd in
  0)
    echo /bulk/job/task/update
    ;;
  1)
    echo /bulk/job/task/done
    ;;
  2)
    echo /bulk/job/task/failed
    ;;
  *[0-9])
    echo "/bulk/service/status/$(printf "\x$(printf %x $((cmd + 94)))")"
    ;;
  *)
    echo "/bulk/service/status/$cmd"
    ;;
  esac
}

cmd=$(parse_command "$1")
shift
task_id=$1
shift
api_base=${1:-api.remote.it/apv/v27}
shift
status=$(printf "%b" "$*")

output=$(mktemp /tmp/remoteit.XXXXXX)

code=$(jq -n \
  --arg taskid "$task_id" \
  --arg description "$status" \
  '{$taskid, $description}' | curl -sfo "$output" -w "%{http_code}" -d @- "https://$api_base$cmd")

if [ "$code" -eq 200 ]; then
  echo "$code $(jq -er '.status' "$output")"
else
  echo "$code $(jq -er '.reason // "FAIL"' "$output")"
fi

rm -f "$output"
