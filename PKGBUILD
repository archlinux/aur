# Maintainer: wayscriber maintainers <devmobasa+aur@proton.me>
pkgname=hyprmarker-debug
pkgver=0.5.1
pkgrel=1
pkgdesc='Transitional meta package that installs wayscriber-debug'
arch=('any')
url='https://wayscriber.com'
license=('MIT')
depends=('wayscriber-debug')
provides=('hyprmarker-debug')
conflicts=('hyprmarker-debug<0.5.1')

pkgver() {
    printf '%s' "$pkgver"
}

package() {
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cat <<'EOF_DOC' > "$pkgdir/usr/share/doc/$pkgname/README"
hyprmarker-debug has been replaced by wayscriber-debug.

This transitional package depends on `wayscriber-debug` and will be
removed after the rename grace period. Update your tooling to reference
wayscriber directly.
EOF_DOC
}
