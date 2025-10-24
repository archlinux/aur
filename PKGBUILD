# Maintainer: wayscriber maintainers <devmobasa+aur@proton.me>
pkgname=hyprmarker-debug
pkgver=0.4.0
pkgrel=4
pkgdesc='Legacy debugging symbols package (obsolete)'
arch=('any')
url='https://devmobasa.com/hyprmarker'
license=('MIT')
depends=()
provides=('hyprmarker-debug')
conflicts=()

pkgver() {
    printf '%s' "$pkgver"
}

package() {
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cat <<'EOF_DOC' > "$pkgdir/usr/share/doc/$pkgname/README"
The hyprmarker-debug package is no longer maintained.

Remove this package once you migrate to the successor project.
EOF_DOC
}
