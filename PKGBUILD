# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname=capter
pkgver=2.2.1
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
sha512sums=("f36598b277930ec4fddd837e4a14f97e7f74485096bd41c9e7339d91c11c897a4a7f0db88e72d778475708c62c8b151fe41ad46947a2184bc5666ea8950964d5")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
