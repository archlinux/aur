# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relagit
pkgver=0.16.7
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('27424156f360f067654a5db91a392b07e98476edec3af0d908011ab2c15ae639')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
