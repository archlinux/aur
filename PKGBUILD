# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relagit
pkgver=0.16.3
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('1e6f92213aefa508566bb94e8dc94fd73d02b2e0c3af45a5f9a8194d10e49d85')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
