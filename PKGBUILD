# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.8
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e9a366afac877e86d2dbc8d9ca3585138b8208581079b44c94000300a8b1cf81')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
