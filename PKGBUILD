# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.0.0
pkgrel=5
pkgdesc='Screen lock program for X like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libxext' 'libxrandr')
makedepends=('make' 'git')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13c50cd76c1a7f451584f933e993dee961f6a63e')

package() {
    cd $pkgname-${pkgver}
    make PREFIX="$pkgdir/usr" instal
}
