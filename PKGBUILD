# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
# Maintainer: Eric Kochen <eric@getpurple.sh>
pkgname=purple-bin
_pkgname=purple
pkgver=3.18.4
pkgrel=1
pkgdesc='Terminal SSH manager with provider sync, tunnels, file transfer and containers'
arch=('x86_64' 'aarch64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('gcc-libs' 'openssh')
options=(!strip !debug)
provides=('purple')
conflicts=('purple-git' 'purple')
source=("LICENSE::https://raw.githubusercontent.com/erickochen/purple/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7ffe3e49f530418a8e37f4546534f20ddbd1109a5a3e3b2ae7fde09d27dae1dc')
sha256sums_x86_64=('41c3230b672c98bafad6fcbe1e4516edec9d0167951ed86ad7ca5f57890fc26e')
sha256sums_aarch64=('74d5428a1a4cbb6ccac48922e148f2081e5744ad5df25163c9fca4e22542b99d')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin" 'purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
