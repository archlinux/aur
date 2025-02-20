#!/bin/sh
out=$1
url=$2
settings=~/.local/share/Rack2/settings.json

get_token() {
  echo "Reading token from $settings ..." >&2
  [ -f "$settings" ] && /usr/bin/jq -re '.token // empty | @uri' "$settings" && return
  echo "Token not found, please log in with your VCV Rack account." >&2
  read -p "Email: " email
  read -s -p "Password: " password
  echo >&2
  /usr/bin/jq -n --arg email "$email" --arg password "$password" '{email: $email, password: $password}' \
    | /usr/bin/curl -s -H 'Content-Type: application/json' -X POST --data-binary @- https://api.vcvrack.com/token \
    | /usr/bin/jq -re '.token // empty | @uri'
}

cookie=""
if [[ "$url" = *RackProDownload* ]]; then
  token="$(get_token)"
  if [ -z "$token" ]; then
    echo "Could not authenticate, please try again." >&2
    exit 1
  fi
  cookie="token=$token"
fi
exec /usr/bin/curl -qgb "$cookie" -fLC - --retry 3 --retry-delay 3 -o $out $url
