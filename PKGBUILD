# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.2
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('214b2738fde92f72be2e8593bfa41c2a8e801fe90470ebbc2c99f3853c51d354')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
