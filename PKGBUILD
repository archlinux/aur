# Maintainer: decipher
pkgname=capter
pkgver=3.0.2
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
sha512sums=("327033476fbf1b3f7d1e2f96ed47402aa38cd4855b76f0e5aaad0b3d3462f2605645327429dc927986bee36ef974f4c1f1adef5791847201a66231580f111004")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
