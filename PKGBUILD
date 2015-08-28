# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: jose <jose1711 [at] gmail (dot) com>
pkgname=vok
pkgver=1.0
pkgrel=10
pkgdesc="Vogo's Keyboard for Xorg 7 (Czech)"
arch=('i686' 'x86_64')
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license=("custom")
depends=('grep' 'xmlstarlet' 'perl')
install='vok.install'
source=("http://vogo.unas.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2" \
        "vok.xml")
md5sums=('f8e4a38568e42d21a6903fe4755eec2d'
         '038d336f9d69b41b90eb031c336991e4')

package() {
  cd "$srcdir"
  install -D -m644 vok "$pkgdir/usr/share/X11/xkb/symbols/vok"
  install -D -m644 vok.xml "$pkgdir/usr/share/vok/vok.xml"
}

