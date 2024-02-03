# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="A tool to work with VPK files (binary release)"
url="https://github.com/craftablescience/VPKEdit"
arch=('x86_64')
license=('MIT')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Installer-gcc-Release.zip")
sha256sums=('42989a4075ef171986ad4b60dd39e9da05a64800ea20ed49a653fa2b53b62d69')

package() {
  ar x VPKEdit-$pkgver-Linux.deb
  tar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 $pkgdir/opt/vpkedit/LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
}
