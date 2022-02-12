# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.16
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="https://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("${pkgname}-${pkgver}"::"https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn")
sha256sums=('466c2e701317152d6f3653d662b1af565815a50d4b95112d40e1ab2e54c132c5')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" ${pkgdir}/usr/bin/mvn
}
