# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=gnome-shell-extension-alt-tab-scroll-workaround
pkgver=5
pkgrel=1
pkgdesc="Temporary fix for a bug that buffers the scroll between different windows (e.g., Chrome and VS Code)"
arch=('any')
url="https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround"
license=('GPL3')
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fc41c68a05e764432f6ff1a70aedf965607d81b9fe48f29c1fe231f016daf184365579279f42b88e91b069da5eede438d4bfb4d68e8a3e3ff9ea7f98a034f415')

package() {
    cd "$pkgname-$pkgver"
    _uuid='alt-tab-scroll-workaround@lucasresck.github.io'
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid" extension.js metadata.json
}
