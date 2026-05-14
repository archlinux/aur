# Maintainer: M. Damian "G'lek" Mulligan <glek at glektarssza dot com>

pkgbase=ghostty-xfce4-helper
pkgname=ghostty-xfce4-helper
pkgver=0.1.0
pkgrel=1
pkgdesc='Adds a "Default Application" entry to Xfce4 for Ghostty.'
arch=(x86_64 aarch64 i686)
license=(MIT)
depends=(ghostty)
makedepends=()
optdepends=()
package() {
    mkdir -p "$pkgdir/usr/share/xfce4/helpers/"
    install -Dm0644 -t "$pkgdir/usr/share/xfce4/helpers/" "$startdir/com.mitchellh.ghostty.desktop"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$startdir/LICENSE"
}
