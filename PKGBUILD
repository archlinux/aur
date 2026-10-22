# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-bin
pkgver=1.9.0
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
sha256sums_x86_64=('290fef0ee96d79d5ddee190198c9144d6a5b7ac9340390b0e324a6675b54b0cd')
sha256sums_aarch64=('6a837b978fa3f1921638178ccbd8416f9f5706a7006bd6c5a4f102521493b764')

package() {
  cd "rettui-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui "$pkgdir/usr/bin/rettui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui/README.md"
}
