# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=vok
pkgver=1.0
pkgrel=9
pkgdesc="Vogo's Keyboard for Xorg 7 (Czech)"
arch=('i686' 'x86_64')
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license="custom"
depends=('grep' 'qizxopen' 'perl')
install='vok.install'
source=("http://vogo.unas.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('f8e4a38568e42d21a6903fe4755eec2d')

build() {
true
}

package() {
mkdir -p $pkgdir/usr/share/X11/xkb/symbols/
cp $srcdir/vok $pkgdir/usr/share/X11/xkb/symbols/
}
