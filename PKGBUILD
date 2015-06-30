# Maintainer: Avi Knoll <aknoll@atlassian.com>
pkgname=mvnvm
pkgver=1.0.6
pkgrel=1
pkgdesc="Run different versions of maven for different projects."
arch=('any')
url="http://mvnvm.org/"
license=('unknown')
groups=()
depends=()
makedepends=(bash)
conflicts=(mvn)
source=(
    https://bitbucket.org/mjensen/mvnvm/raw/bd208279d9263ef39e3fe272a22c3123fae9616f/mvn
)
sha256sums=('839c9bc87334f56c3f7d196a38747f9b1e9863c6da0b3d23b4cfe6e940079c09')
package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/mvn ${pkgdir}/usr/bin/mvn
    chmod 0755 ${pkgdir}/usr/bin/mvn
}
