# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=git-standup
pkgver=2.3.1
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
md5sums=('d5862e2922fa4562e388746a318525e2')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm 0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
