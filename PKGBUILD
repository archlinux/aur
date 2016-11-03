# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.9
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('893e13a9a61a89bacf29ee141bd9f6e8935710323701e3d36584a4bb90e1372d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
