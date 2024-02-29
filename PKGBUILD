# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=4.1.2
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-gcc-Release.zip")
sha256sums=('091fdad95ac41076449e025e526e3c478e223cbd9f0063d868d5311e1a6dd1a0')

package() {
  ar x VPKEdit-$pkgver-Linux.deb
  tar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 $pkgdir/opt/vpkedit/LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
}
