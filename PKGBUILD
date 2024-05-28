# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relagit
pkgver=0.15.0
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('88746dfd93c83c62ee8a2a87971b2247627823f3944e57f4169d567aa0d6c4c9')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
