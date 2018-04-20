# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=sourcekitten
pkgver=0.20.0
pkgrel=1
pkgdesc='An adorable little framework and command line tool for interacting with SourceKit..'
arch=('any')
url='https://github.com/jpsim/SourceKitten'
license=('MIT')
depends=('swift-language')
makedepends=('swift-language')
source=("https://github.com/jpsim/SourceKitten/archive/$pkgver.tar.gz")
sha256sums=('5241e78db706b2da0b7527cc4991a5b5aa9c2e87d7acc32be17d20ee7dea45b2')

package() {
    cd "SourceKitten-$pkgver"
    make install PREFIX="${pkgdir}/usr"
}
