# Maintainer: decipher3114 <decipher3114@gmail.com>
pkgname=capter
pkgver=2.4.0
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
sha512sums=("f2789dc8ebe9056a6efcd6fbfa2e604377312323b71b8dbbab697b3d82c63a3514e864bec90dfc31d45e618f16493fa5be25fe25187dcdce098e39deb93ba61f")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
