# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=5.0.0.1
pkgrel=1
pkgdesc="A library and CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme' 'xcb-util-cursor')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-DEB-gcc-Release.zip")
sha256sums=('43a8c31db14b7ad3f7542cd5b447a0ff8aa155a187cfe133191f5e12d78d4b28')

package() {
# ar x VPKEdit-$pkgver-Linux.deb
  ar x VPKEdit-5.0.0-Linux.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
