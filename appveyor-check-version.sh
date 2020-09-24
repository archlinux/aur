#!/usr/bin/env bash

# to check for string:
# Latest version is <a href=/releases/7.0.2915/ >7.0.2915</a> published on Aug 16, 2020.

# get url from env as APVSH_URL
APVSH_URL="${APVSH_URL:-https://www.appveyor.com/self-hosted/}"

ver() {
    # if $# > 0 (has additional arguments), then output version string to stdout
    tmp=$(mktemp)
    curl -Ls "$APVSH_URL" | grep -Pof ver.pgrep > "$tmp"
    EXIT=$?

    test "$#" -gt 0 && cat "$tmp"

    return $EXIT
}

ver "$@"

