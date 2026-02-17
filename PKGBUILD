# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=scrpr-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
provides=('scrpr')
conflicts=('scrpr')
source=("scrpr-${pkgver}.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v${pkgver}/scrpr_Linux_x86_64.tar.gz")
sha256sums=('3a90bee68451f69761921081200e27dbe38de127c7238097b6087127e7c3278b')

package() {
    install -Dm755 scrpr "$pkgdir/usr/bin/scrpr"
}
