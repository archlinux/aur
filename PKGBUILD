# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.14
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="https://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("${pkgname}-${pkgver}"::"https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn")
sha256sums=('325a98d1021b5f41d554c24517c01430f5bfc4e6ab1f322381dc38442023f40e')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" ${pkgdir}/usr/bin/mvn
}
