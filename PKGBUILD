# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('i686' 'x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('76a3a6eafb2879bb7a8deef223a7244401506d8e3c2f91b6eb81d6a238fb75f6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
