# Maintainer: Volker Schwaberow <volker@schwaberow.de>
pkgname=kickassembler
pkgver=5.25
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
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
noextract=()
sha256sums=(
  '9ef752c12b25f64b55bafecfabf23dfc90a8216b1a293548b2147ed7c15f55a6'
  '625fb64e878c31c699696bd035fcfa28f1307f2fe93b78661357ea9d3d0d71c8'
)

package() {
    install -Dm644 KickAss.jar "$pkgdir/usr/share/java/kickassembler/KickAss.jar"
    install -Dm755 kickass "$pkgdir/usr/bin/kickass"
}
