# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll@atlassian.com>

pkgname=mvnvm
pkgver=1.0.12
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="http://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("${pkgname}-${pkgver}"::"https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn")
sha256sums=('6ce49ff5121d3e75cd22c74b5473032e0b57bffade60292e74a99a4472d3d3c6')
package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" ${pkgdir}/usr/bin/mvn
}
