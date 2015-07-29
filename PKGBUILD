# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.1
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('be912e2201fae57d92797dafa3045a202147a633db26fd9407251b80ab07b96e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
