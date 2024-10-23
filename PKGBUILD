# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname=capter
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="A simple cross-platform screenshot tool"
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
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/decipher3114/Capter/releases/latest/download/Capter_${pkgver}_x86_64.tar.gz)
sha512sums=("SKIP")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
