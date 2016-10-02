_5_0_0_2_changes() {
    echo ':: Upstream added a gtk2 platform theme'
    echo '   unexport `QT_STYLE_OVERRIDE`'
    echo '   export `QT_QPA_PLATFORMTHEME=gtk2`'
}

post_upgrade() {
    local versions=(
        '5.0.0-2'
    )
    local version
    for version in "${versions[@]}"; do
        if [[ "$( vercmp "${version}" "${2}" )" -eq 1 ]]; then
            "$( printf '_%s_changes' "${version}" | perl -p -e 's/\.|-/_/g' )"
        fi
    done
}
