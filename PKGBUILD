# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
pkgname=freemarker
pkgver=2.3.32
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
sha256sums=('13154d4dfd7cb8ca6f8afcb5fffcfc9f358d6967986707a9a81d450d5438ec86'
            'SKIP')

package() {
    cd $srcdir/apache-freemarker-$pkgver-bin
    install -Dm644 freemarker.jar $pkgdir/usr/share/java/freemarker/freemarker.jar
}
