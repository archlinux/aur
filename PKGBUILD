# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=gnome-shell-extension-alt-tab-scroll-workaround
pkgver=6
pkgrel=1
pkgdesc="Temporary fix for a bug that buffers the scroll between different windows (e.g., Chrome and VS Code)"
arch=('any')
url="https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround"
license=('GPL3')
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('15928fbffa18ebc3a1b80a07400aa94d11da6e4f4ee1ab4d53b47144743d80bc03ca42afba267b66a7841484b37e68f94e2f76e0bdf363cb42afd41516030822')

package() {
    cd "$pkgname-$pkgver"
    _uuid='alt-tab-scroll-workaround@lucasresck.github.io'
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid" extension.js metadata.json
}
