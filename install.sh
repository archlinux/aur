_5_0_0_2_changes() {
    echo ':: Upstream added a gtk2 platform theme'
    # shellcheck disable=SC2016
    echo '   unexport `QT_STYLE_OVERRIDE`'
    # shellcheck disable=SC2016
    echo '   export `QT_QPA_PLATFORMTHEME=gtk2`'
}

post_upgrade() {
    local versions=(
        '5.0.0-2'
    )
    local version
    for version in "${versions[@]}"; do
        if [[ "$( vercmp "${version}" "${2}" )" -eq 1 ]]; then
            # shellcheck disable=SC2091
            "$( printf '_%s_changes' "${version}" | perl -p -e 's/\.|-/_/g' )"
        fi
    done
}
