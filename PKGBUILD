# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=sourcekitten
pkgver=0.21.0
pkgrel=1
pkgdesc='An adorable little framework and command line tool for interacting with SourceKit..'
arch=('any')
url='https://github.com/jpsim/SourceKitten'
license=('MIT')
depends=('swift-language')
makedepends=('swift-language')
source=("https://github.com/jpsim/SourceKitten/archive/$pkgver.tar.gz")
sha256sums=('3304a243769061a3e34c14e4222f8a9f4fe72f5c21f5abf69863f4e76a019af1')

package() {
    cd "SourceKitten-$pkgver"
    make install PREFIX="${pkgdir}/usr"
}
