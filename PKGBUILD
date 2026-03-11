# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.1.0
pkgrel=0
pkgdesc='Screen lock program for X like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libxext' 'libxrandr')
makedepends=('make' 'git')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d186a9361c6eaef528fe64686cbffcbef065525a988e1db4da4c56868868314c')

package() {
    cd $pkgname-${pkgver}
    make PREFIX="$pkgdir/usr" instal
}
