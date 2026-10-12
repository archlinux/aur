# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=1.7.0
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
sha256sums_x86_64=('b4e071601aaa9836e6a86debd426ab051731138924c5bd5955bc2f8cdae21614')
sha256sums_aarch64=('6e81b3cfeba6742d524c14ac7143bd1218b6f83d0a531917a2fe49ef902b71bb')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
}
