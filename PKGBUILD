# Maintainer: Maxwell Beck <max@ryt.one>
pkgname=kickassembler
pkgver=5.16
pkgrel=1
pkgdesc="An advanced MOS 65xx assembler combined with a Java Script like script language."
arch=(any)
url="http://www.theweb.dk/KickAssembler/Main.html"
license=('custom')
groups=()
depends=(java-runtime)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.zip::http://www.theweb.dk/KickAssembler/KickAssembler.zip" "kickass")
noextract=()
md5sums=('a79b4cd3cdbe2d0ef450ee742dcf1638'
         '885cea5372b31ba633e2baedd71e64a4')

package() {
    install -Dm644 KickAss.jar "$pkgdir/usr/share/java/kickassembler/KickAss.jar"
    install -Dm644 KickAss3To4Converter.jar "$pkgdir/usr/share/java/kickassembler/KickAss3To4Converter.jar"

    install -Dm755 kickass "$pkgdir/usr/bin/kickass"
}
