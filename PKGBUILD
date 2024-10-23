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
sha512sums=("88855f3ca9bebc223b13c3b22887b0abfdd0c964e585785e971518b534d266d5173e19886810993731f5ea14ff301c9958688822f6577d0144d4ebf58ad8ea89")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
