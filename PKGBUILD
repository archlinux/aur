# Maintainer: Kavya Gokul < hello@properlypurple.com >

pkgname=pridecat-git
_pkgname=pridecat-git
pkgver=git
pkgrel=7ee6f1d
pkgdesc="Colorize your terminal output with pride!"
arch=('i686' 'x86_64')
url="Colorize your terminal output with pride!"
license=('CC-BY-NC')
depends=()
makedepends=()
conflicts=()
source=("git+https://github.com/lunasorcery/pridecat")
sha256sums=('SKIP')


build() {
  cd "${srcdir}/pridecat"
  make
}

package() {
  cd "${srcdir}/pridecat"
  mkdir -p "${pkgdir}/usr/bin"
  install --mode=755 -D -- pridecat ${pkgdir}/usr/bin/pridecat
}
