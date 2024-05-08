# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
depends=('qt6-base')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-gcc-Release.zip")
sha256sums=('3b3ee25a41055c8107288cd9b00059fc3198931521aface1fa7675e97062b27d')

package() {
  ar x VPKEdit-$pkgver-Linux.deb
  tar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 $pkgdir/opt/vpkedit/LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
}
