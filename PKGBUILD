# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname=ttf-tengwar-telcontar
pkgver=0.08
pkgrel=1
pkgdesc="A tengwar (Tolkien's elvish) font using the CSUR character mapping"
license=("gpl3")
arch=("any")
url="https://freetengwar.sourceforge.net/tengtelc.html"
source=(
  "$pkgname-$pkgver.zip::http://sourceforge.net/projects/freetengwar/files/TengwarFont/TengwarTelcontar.008.zip/download"
)
sha256sums=('f88780510e5c14f66e252fabce5d58febc7bec962d5c17f21ac82002ce85b925')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" tengtelc.ttf
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" tengtelcb.ttf
	install -Dm644 README.txt "$pkgdir/usr/share/${pkgname}/README"
}

