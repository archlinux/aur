# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>

pkgname=postgresql-unit
pkgver=3.1
pkgrel=1
pkgdesc='SI Units for PostgreSQL'
arch=('i686' 'x86_64')
url='https://github.com/ChristophBerg/postgresql-unit'
license=('GPL3')
depends=('postgresql')
source=('https://codeload.github.com/ChristophBerg/postgresql-unit/tar.gz/3.1')
sha256sums=('60a8be238b7521d37b0541e07ff3be775490c53e184524b0b18c3b0bd2be06f2')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
