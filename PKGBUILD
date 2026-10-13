# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Reticulum client for the terminal and the browser: LXMF messaging, NomadNet browsing and hosting, and RRC chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zevaryx/rettui"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('rettui')
conflicts=('rettui')
source_x86_64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9d41f845971c1982a0c788038ba5079f4623b61675d9867e07b8b49cc9082a64')
sha256sums_aarch64=('a87d52d1f498b76b4aea49da35799b7eab1516042552ffa0a21e37fb45b88a3d')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
}
