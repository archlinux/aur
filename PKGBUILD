# Maintainer: Avi Knoll <aknoll@atlassian.com>
pkgname=mvnvm
pkgver=1.0.9
pkgrel=2
pkgdesc="Run different versions of maven for different projects."
arch=('any')
url="http://mvnvm.org/"
license=('unknown')
groups=()
depends=()
makedepends=(bash)
provides=(maven)
source=(
    https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn
)
sha256sums=('7f09faee6147aac4d57a73e7e97a053ca3350a737048104c7ae4cee6addde0d0')
package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/mvn ${pkgdir}/usr/bin/mvn
    chmod 0755 ${pkgdir}/usr/bin/mvn
}
