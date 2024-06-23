# Maintainer: Zhijun Zhang <zhangzhijun23@mails.ucas.ac.cn>

pkgname=galfit
pkgver=3.0.5
pkgrel=1
pkgdesc="GALFIT: Detailed Structural Decomposition of Galaxy Images"
url="https://users.obs.carnegiescience.edu/peng/work/galfit/galfit.html"
arch=('x86_64')
license=('Custom')
depends=('ncurses5-compat-libs')
makedepends=()
conflicts=()
replaces=()
source=(https://users.obs.carnegiescience.edu/peng/work/galfit/galfit3-debian64.tar.gz)
sha256sums=('bd5954674d303a902f77076fe92a66f47e460bf1cf2429d4e03b350b44043dd5')
package() {
    cd ${srcdir}
    tar -xzvf galfit3-debian64.tar.gz
    install -Dm755 galfit ${pkgdir}/usr/bin/${pkgname}
}

