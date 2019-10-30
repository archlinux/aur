# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.13
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="http://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("${pkgname}-${pkgver}"::"https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn")
sha256sums=('a7bfeed72427a7e7412a0de857de5c100bda431625de2eb28ba2d96d12c1e8e5')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" ${pkgdir}/usr/bin/mvn
}
