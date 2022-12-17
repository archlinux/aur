# Maintainer:Integral<luckys68@126.com>
pkgname=xelfviewer-bin
_pkgname=xelfviewer
pkgver=0.05
pkgrel=1
pkgdesc="ELF file viewer/editor."
arch=('x86_64')
url="https://github.com/horsicq/XELFViewer"
license=('MIT')
depends=('hicolor-icon-theme' 'qt5-base')
conflcts=('xelfviewer-appimage')
source=(
	"${_pkgname}-${pkgver}_amd64.deb::https://github.com/horsicq/XELFViewer/releases/download/${pkgver}/${_pkgname}_${pkgver}_Debian_11_amd64.deb"
)
sha512sums=('fd35a7aa8a886fd02d88592a8b633c3b0c88591553c4abfe7f1895232682cacb04c4a011a18ff26cc06b86174752ff79c5d14c3b2d9a2eb9c089385874228fdd')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
}
