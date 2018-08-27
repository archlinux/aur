# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: jose <jose1711 [at] gmail (dot) com>
pkgname=vok
pkgver=1.0
_pkgver=9b338e5c
pkgrel=11
pkgdesc="Vogo's Keyboard for Xorg 7 (Czech)"
arch=('any')
# see also http://www.abclinuxu.cz/blog/origami/2006/12/21/162644
url="https://gitlab.com/vojta_vogo/vok"
license=('GPL3')
depends=('grep' 'xmlstarlet' 'perl')
install=vok.install
source=("https://gitlab.com/vojta_vogo/vok/raw/$_pkgver/xorg/vok"
        "vok.xml")
sha256sums=('2b683970f8fbaf92dea41a7c483bdd00b30a1b695a7a983266d0364078a19274'
            'c4440340e5a7d4ad05e4c6d6fa2bf0eb4f642a6007a09621339a42cd6786a492')

package() {
  cd "$srcdir"
  install -D -m644 vok "$pkgdir/usr/share/X11/xkb/symbols/vok"
  install -D -m644 vok.xml "$pkgdir/usr/share/vok/vok.xml"
}

