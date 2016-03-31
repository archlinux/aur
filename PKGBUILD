# Maintainer: Sander Zuidema <s.zuidema at bazix dot nl>
# Contributar: Patrick Hanckmann <hanckmann gmail com>

pkgname=mtconverter
pkgver=0.01
pkgrel=2
pkgdesc="The mtconverter convert files from the MT940 format to the OFX format so that bank transactions can be imported in the GnuCash banking software. Successfully tested with ABNAMRO and GnuCash version 2.2.6"
arch=('any')
url="http://mtconverter.sourceforge.net/"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
 https://sourceforge.net/projects/$pkgname/files/mtconverter/Initial%20release/$pkgname-$pkgver.jar/download
 $pkgname
)
noextract=(download)

package() {
 mkdir -p "$pkgdir/usr/share/java/$pkgname"
 mkdir -p "$pkgdir/usr/bin"
 install -m755 download "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
 install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('818a4b8bbcb50878a8b1b9f71b4274d242ab46bf860c74676e98dec1d0248821'
            'b56256e00343a028fb175db6bde1772b1fe625b2980097ff50c05d7f8c682496')


