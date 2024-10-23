# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname=capter
pkgver=2.2.0
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
sha512sums=("ae03b78e459c7527c86cf6f7e3346ca3ce0199eadcb17f6bb87b948fd321e40885c92dcc37b1393a14689164326fe14be51ead1c80d0e028def21a02571d1c70")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
