# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=1.7.2
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
sha256sums_x86_64=('c97a23b12b4023f45d3cf77c9844bb64b31d8389f2153a01259c2b7b398933e4')
sha256sums_aarch64=('0d2d026418a506e6332b4d5953a015469d8238bc02e7d3bb60163cc43cbf3350')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
}
