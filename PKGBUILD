# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple-bin
_pkgname=purple
pkgver=2.9.0
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
sha256sums_x86_64=('2889eecc27f05eceeb1b7308c2c1bcef8e75af510ce23bca6c168a9d7c8b80fa')
sha256sums_aarch64=('da5b9d9758a5bff7dd717fca8c4594bd73072b935545066f4993630b750d27d0')

package() {
    install -Dm0755 -t ${pkgdir}/usr/bin 'purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
