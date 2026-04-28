# Maintainer: Sebastian Kootz - skxxtz@gmail.com
pkgname="sherlock-launcher-gpui-bin"
pkgver=0.2.2
pkgrel=1
pkgdesc="Application launcher for Wayland."
arch=('x86_64')
url="https://github.com/Skxxtz/sherlock-gpui"
license=('custom:CC-BY-NC-4.0')
depends=('gtk4-layer-shell')
conflicts=('sherlock-launcher-git' 'sherlock-launcher-bin' 'sherlock-launcher-unstable-git')
source=("https://github.com/Skxxtz/sherlock-gpui/releases/download/v${pkgver}/sherlock-v${pkgver}-x86_64.tar.gz")
sha256sums=('af52ae73d705ef79e4f877d8731e1d009932dbee928b2cdc469aab957bb6f9cf')

package() {
    install -Dm755 "$srcdir/sherlock" "$pkgdir/usr/bin/sherlock"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
