# Maintainer: decipher
pkgname=capter
pkgver=3.1.0
pkgrel=1
epoch=
pkgdesc="Cross-Platform Screen Capture and Annotation Tool"
arch=('x86_64')
depends=(gtk3 
xdotool 
libayatana-appindicator 
libxcb 
libxrandr 
dbus)
provides=()
conflicts=()
replaces=()
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/decipher3114/Capter/releases/latest/download/capter_${pkgver}_x86_64.tar.gz)
sha512sums=("01700560a4e6347716054b4f87ce3dbd0b79ecf4d67f6b48deab3b4eed9323f0b6d1698f25a023efd3e4b83d56ee22fbb9adf7bbbea532acfc8ef9809e151412")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
