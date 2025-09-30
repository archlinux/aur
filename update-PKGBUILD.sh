#!/usr/bin/env bash

update-sha256() {
    local sum old_sum sha256sums header="'Duo Desktop'" subheader="'Linux'" url="https://duo.com/docs/checksums#duo-desktop" file="duo-desktop-latest.x86_64.rpm"

    eval "$(grep sha256sums PKGBUILD)"
    old_sum="${sha256sums[0]}"

    sum="$(curl --silent "$url" | xmllint --html --xpath "//h2[contains(text(), $header)]/following-sibling::h3[contains(text(), $subheader)][1]/following-sibling::pre//a[contains(@href, '$file')]/text()" - 2>/dev/null | sed -E 's/([a-f0-9]{64}).*$/\1/')"

    [[ $sum ]] || {
        echo "Failed to retrieve checksum."
        return 1
    }

    if [[ $sum == "$old_sum" ]]; then
        echo "Checksum has not changed."
        return 1
    fi

    sed -i "s|sha256sums=('.*')|sha256sums=('${sum}')|" PKGBUILD
}

update-pkgver() {
    local pkgver old_pkgver header="'Duo Desktop for Linux'" subheader="'Version'" url="https://duo.com/docs/duo-desktop-notes#duo-desktop-for-linux"

    old_pkgver=$(grep pkgver PKGBUILD | cut -d= -f2)
    pkgver="$(curl --silent "$url" | xmllint --html --xpath "//h2[contains(text(), $header)]/following-sibling::h3[contains(text(), $subheader)][1]/text()" - 2>/dev/null | sed -E 's/Version ([0-9]+(\.[0-9]+){2}).*$/\1/')"

    [[ $pkgver ]] || {
        echo "Failed to retrieve version."
        return 1
    }

    if [[ $pkgver == "$old_pkgver" ]]; then
        echo "Version has not changed."
        return 1
    fi

    sed -Ei "s/(pkgver=).*/\1$pkgver/" PKGBUILD
}

main() {
    local changed_PKGBUILD=false pkgrel old_pkgrel

    if update-sha256; then
        changed_PKGBUILD=true
        echo "Updated PKGBUILD with new checksum"
    fi
    if update-pkgver; then
        changed_PKGBUILD=true
        echo "Updated PKGBUILD with new version"
    fi

    if $changed_PKGBUILD; then
        old_pkgrel=$(grep pkgrel PKGBUILD | cut -d= -f2)
        pkgrel=$((old_pkgrel + 1))
        sed -Ei "s|(pkgrel=)$old_pkgrel|\1$pkgrel|" PKGBUILD
        echo "Incremented pkgrel to $pkgrel"
    fi
}

main "$@"
