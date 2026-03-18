# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple-bin
_pkgname=purple
pkgver=2.3.0
pkgrel=1
pkgdesc='TUI to search, connect and manage SSH servers. Visual file transfer, cloud sync (10 providers), password management. Edits ~/.ssh/config directly.'
arch=('x86_64' 'aarch64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('openssh')
options=(!debug)
provides=('purple')
conflicts=('purple-git' 'purple')
source=("LICENSE::https://raw.githubusercontent.com/erickochen/purple/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7ffe3e49f530418a8e37f4546534f20ddbd1109a5a3e3b2ae7fde09d27dae1dc')
sha256sums_x86_64=('920240c48689233ecc873f4678a18831fa65ff3fe161e3cc9f7ca4d5c17361f3')
sha256sums_aarch64=('293afef3a49fa5586fa2a4c4a7806baf256fbf8f54087d1a28184afd951f994c')

package() {
    install -Dm0755 -t ${pkgdir}/usr/bin 'purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
