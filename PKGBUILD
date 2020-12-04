# Maintainer: lynix <lynix47@gmail.com>

pkgname=journalcheck
pkgver=1.1
pkgrel=1
pkgdesc="A simple replacement for logcheck when using journald"
url="https://github.com/lynix/journalcheck"
arch=('any')
license=('MIT')
depends=('grep' 'systemd')
optdepends=()
makedepends=()
conflicts=( 'journalcheck-git' )
replaces=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lynix/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e304bb6942ada2d97c2b7dd42d0db850')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
