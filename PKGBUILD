# Maintainer: wayscriber maintainers <devmobasa+aur@proton.me>
pkgname=hyprmarker
pkgver=0.4.0
pkgrel=7
pkgdesc='Legacy hyprmarker package (obsolete)'
arch=('any')
url='https://devmobasa.com/hyprmarker'
license=('MIT')
depends=()
provides=('hyprmarker')
conflicts=()

pkgver() {
    printf '%s' "$pkgver"
}

package() {
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cat <<'EOF_DOC' > "$pkgdir/usr/share/doc/$pkgname/README"
The hyprmarker package has been retired.

Remove this package and install the actively maintained successor
from the project site. Existing configuration files are left untouched
so you can migrate settings manually.
EOF_DOC
}
