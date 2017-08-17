# Maintainer: Avi Knoll <aknoll@atlassian.com>
pkgname=mvnvm
pkgver=1.0.9
pkgrel=1
pkgdesc="Run different versions of maven for different projects."
arch=('any')
url="http://mvnvm.org/"
license=('unknown')
groups=()
depends=()
makedepends=(bash)
conflicts=(maven)
source=(
    https://bitbucket.org/mjensen/mvnvm/raw/mvnvm-${pkgver}/mvn
)
sha256sums=('968e09aa2dec3c9374e2fb40aaaa73ef313a31b333abc71ca937a25d9e4a6c89')
package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/mvn ${pkgdir}/usr/bin/mvn
    chmod 0755 ${pkgdir}/usr/bin/mvn
}
