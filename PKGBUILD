# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=vok_sk
pkgver=1.0
pkgrel=8
pkgdesc="Vogo's Keyboard for Xorg 7 (Slovak)"
arch=('i686' 'x86_64')
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license="custom"
depends=('grep' 'qizxopen' 'perl')
install='vok_sk.install'
#source=(http://kde-sk.skosi.org/_stuff/${pkgname})
source=(https://github.com/vogo/vok/raw/master/xorg/${pkgname})
md5sums=('2a99ad4873dda74f1a44e16e5d603df1')

build() {
true
}

package() {
mkdir -p $pkgdir/usr/share/X11/xkb/symbols/
cp $srcdir/vok_sk $pkgdir/usr/share/X11/xkb/symbols/
}
