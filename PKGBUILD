# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
pkgname=freemarker
pkgver=2.3.31
pkgrel=1
pkgdesc="a generic tool to generate text output based on templates"
arch=(any)
url=https://freemarker.apache.org/
license=(Apache)
depends=(java-runtime-headless)
makedepends=()
source=("https://downloads.apache.org/freemarker/engine/$pkgver/binaries/apache-freemarker-$pkgver-bin.tar.gz"{,.asc})
validpgpkeys=(
    13AC2213964ABE1D1C147C0E1939A2520BAB1D90 # Daniel Dekany <ddekany@apache.org>
)
sha256sums=('8723ec9ffe006e8d376b6c7dbe7950db34ad1fa163aef4026e6477151a1a0deb'
            'SKIP')

package() {
    cd $srcdir/apache-freemarker-$pkgver-bin
    install -Dm644 freemarker.jar $pkgdir/usr/share/java/freemarker/freemarker.jar
}
