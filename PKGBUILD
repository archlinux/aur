# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.15
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="https://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("${pkgname}-${pkgver}"::"https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn")
sha256sums=('aca72679f08349f756c5d62fd36d3dd67f25e937b8cd2045b0edd0f91efbee18')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" ${pkgdir}/usr/bin/mvn
}
