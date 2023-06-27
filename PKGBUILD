# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=git-standup
pkgver=2.3.2
pkgrel=1
pkgdesc="Recall what you did on the last working day"
arch=('any')
url="https://github.com/kamranahmedse/git-standup"
license=('MIT')
depends=('bash')
makedepends=('make')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('49c02d823a7bc9358d7a4b14d0c754d8')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm 0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
