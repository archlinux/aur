# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relagit
pkgver=0.16.0
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('4f10b9d9b86ecbf1759dc36766bfaf54c975847dd49580643ba4df2cfdd0e5a5')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
