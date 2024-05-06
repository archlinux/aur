# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relaGit-bin
pkgver=0.14.12
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
depends=()
provides=("RelaGit")
conflicts=()
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('9f42b36c89f3a851232da031d27f93bb7f5ff1f86bb222e662d1ae9b6a72162a')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
