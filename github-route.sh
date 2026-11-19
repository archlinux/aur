# Sourced by PKGBUILD.
_github_proxy() {
    printf '%s' "${MIHOMO_PARTY_GITHUB_PROXY-${https_proxy:-${HTTPS_PROXY:-${all_proxy:-${ALL_PROXY:-}}}}}"
}

_github_probe() {
    LC_ALL=C curl --disable --silent --show-error --fail --location --max-time 8 \
        --proto '=https' --proto-redir '=https' --noproxy '' --proxy "$1" \
        --range 0-524287 --max-filesize 524288 --output /dev/null \
        --write-out '%{size_download} %{time_total}' \
        https://github.com/googlefonts/noto-emoji/raw/main/2D/fonts/NotoColorEmoji.ttf
}

# Both routes fetch the same 512 KiB. Elapsed time includes redirects and setup.
_github_rank() {
    local proxy=$1 direct_sample='' proxy_sample='' direct_pid proxy_pid
    local samples
    samples=$(mktemp -d) || return
    _github_probe '' > "$samples/direct" 2>/dev/null &
    direct_pid=$!
    _github_probe "$proxy" > "$samples/proxy" 2>/dev/null &
    proxy_pid=$!
    if wait "$direct_pid"; then read -r _ direct_sample < "$samples/direct" || :; fi
    if wait "$proxy_pid"; then read -r _ proxy_sample < "$samples/proxy" || :; fi
    # curl omits the trailing newline. Require the complete sample.
    [[ $(cut -d' ' -f1 "$samples/direct") == 524288 ]] || direct_sample=
    [[ $(cut -d' ' -f1 "$samples/proxy") == 524288 ]] || proxy_sample=
    rm -rf -- "$samples"
    printf 'GitHub sample (512 KiB): direct %s, proxy %s\n' \
        "${direct_sample:+${direct_sample}s}" "${proxy_sample:+${proxy_sample}s}" >&2
    [[ -n $proxy_sample ]] &&
        { [[ -z $direct_sample ]] || LC_ALL=C awk -v p="$proxy_sample" -v d="$direct_sample" 'BEGIN { exit !(p < d) }'; }
}

_github_git_on_route() (
    local proxy=$1
    shift
    unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY no_proxy NO_PROXY
    command git -c "http.https://github.com/.proxy=$proxy" \
        -c http.lowSpeedLimit=1024 -c http.lowSpeedTime=30 "$@"
)

_github_git() {
    local proxy first='' second
    proxy=$(_github_proxy)
    second=$proxy
    if [[ -n $proxy ]] && _github_rank "$proxy"; then
        first=$proxy
        second=''
    fi
    if [[ -n $first ]]; then
        printf 'GitHub Git download via proxy\n' >&2
    else
        printf 'GitHub Git download via direct connection\n' >&2
    fi
    if ! _github_git_on_route "$first" "$@"; then
        [[ -n $proxy ]] || return 1
        printf 'GitHub Git download failed; retrying via the other route\n' >&2
        _github_git_on_route "$second" "$@" || return
        first=$second
    fi
    # Store only the route label in the makepkg process through the mirror config.
    local mirror=$PWD
    [[ $1 != clone ]] || mirror=${!#}
    local route=direct
    [[ -z $first ]] || route=proxy
    command git -c safe.bareRepository=all -C "$mirror" config mihomoparty.githubroute "$route"
}

_github_build_env() {
    local proxy route
    proxy=$(_github_proxy)
    route=$(command git -c safe.bareRepository=all --git-dir="$(command git remote get-url origin)" \
        config --get mihomoparty.githubroute 2>/dev/null) || route=
    if [[ -n $proxy && ( $route == proxy || -z $route ) ]]; then
        export http_proxy="$proxy" https_proxy="$proxy" HTTP_PROXY="$proxy" HTTPS_PROXY="$proxy"
    else
        unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
    fi
    export NODE_USE_ENV_PROXY=1
}
