# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple-bin
_pkgname=purple
pkgver=2.14.2
pkgrel=1
pkgdesc='TUI to search, connect and manage SSH servers. Visual file transfer, cloud sync (12 providers), password management. Edits ~/.ssh/config directly.'
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
sha256sums_x86_64=('60a2f9881008d3f94c7860e9c17b4dc00efa43908163a287acf74ac4b8bc1ed8')
sha256sums_aarch64=('49deaeee13f9e733351f11b175df1970c369b9e21475a7a59d87ac7c94043b6c')

package() {
    install -Dm0755 -t ${pkgdir}/usr/bin 'purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
