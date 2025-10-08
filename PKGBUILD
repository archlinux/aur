# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=5.0.0.3
pkgrel=1
pkgdesc="A CLI/GUI tool to create, read, and write several pack file formats (binary release)"
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme' 'libglvnd' 'qt6-svg' 'xcb-util-cursor' 'qt6-base')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-DEB-gcc-Release.zip")
sha256sums=('3e2224d4dddb4f8a79a3a464cd8e17f4108fa39ed0b4d7d77036c3b7bba74aa5')

package() {
# ar x VPKEdit-$pkgver-Linux.deb
  ar x VPKEdit-5.0.0-Linux.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
