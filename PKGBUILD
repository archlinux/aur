# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname=capter
pkgver=3.0.0
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
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/decipher3114/Capter/releases/latest/download/capter_${pkgver}_x86_64.tar.gz)
sha512sums=("8c7bb3ae51582f997b072f6d848b984c6ca5d359079c04f524c8b371b62f7d703037527a54d0b4edc27075f7880c4622b0f0fce6204dc18fd21863d971d432f0")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
