#!/usr/bin/env sh
tmpdir=$(mktemp -d)

mkfifo "${tmpdir}/response"

handle() {
  while read line; do
    trline=$(echo "$line" | tr -d '[\r\n]')
    [ -z "$trline" ] && break

    echo $trline
    MAC_REGEX='.*\s.*mac=(.{17})\sHTTP.*'
    [[ "$trline" =~ $MAC_REGEX ]] &&
      MAC=$(echo $trline | sed -E "s/$MAC_REGEX/\1/")
  done

  domain=$(for name in $(virsh list --name); do virsh domiflist "${name}" | grep -i -q "${MAC}" && echo "${name}" && break; done)
  echo "${domain}"
  ([[ -z "${MAC}" ]] || [[ -z "${domain}" ]]) &&
    domain="-"

  RESPONSE="$(cat <<EOF
HTTP/1.1 200
Content-Type: text/plain

${domain}
EOF
)"

  echo -e "$RESPONSE" > "${tmpdir}/response"
}

while true; do
  cat "${tmpdir}/response" | nc -lN "${PORT:-3000}" | handle
done
