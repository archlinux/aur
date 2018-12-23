# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=legerd-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Legerdemain is a fantasy computer role-playing game (CRPG) that you can play for free.'
arch=('any')
depends=('java-runtime' 'sh')
optdepends=('ttf-ms-fonts: Courier New or Lucida Sans Typewriter is required'
            'ttf-ms-win10: Courier New or Lucida Sans Typewriter is required')
url='http://roguelikefiction.com/'
license=('Commercial')
source=('http://roguelikefiction.com/bindrops/1.1.0/legerd-20100902-2319-bin-v110.tar.gz'
        'legerd.sh')
sha1sums=('92f09c0c9c680498c31c2835d3ca200c788682de'
          '6f9c3cc1e8c2f788cd70b07aa65fb82881faa1ae')

package() {
  install -D -m644 ${srcdir}/areas.jar ${pkgdir}/usr/share/java/legerdemain/areas.jar
  install -D -m644 ${srcdir}/info.jar ${pkgdir}/usr/share/java/legerdemain/info.jar
  install -D -m644 ${srcdir}/tiles.jar ${pkgdir}/usr/share/java/legerdemain/tiles.jar
  install -D -m644 ${srcdir}/legerd.jar ${pkgdir}/usr/share/java/legerdemain/legerd.jar

  install -D -m755 ${srcdir}/legerd.sh ${pkgdir}/usr/bin/legerd
}

