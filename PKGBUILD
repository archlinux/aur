# Contributor: grimi <grimi at poczta dot fm>

pkgname=mime-archpkg
pkgver=0.3.6.2
pkgrel=1
pkgdesc="mime type for archlinux packages"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('shared-mime-info' 'gtk-update-icon-cache' 'librsvg' 'imagemagick')
install=${pkgname}.install
source=(${pkgname}.{xml,sh} {hicolor,gnome,Tango,oxygen,nuoveXT2,Faenza,Faience,NITRUX,Numix,breeze,FaenzaFlattr2-Zephyr,elementary}.svgz)
sha1sums=('93b739fec9667c80837d38ff67d4a69faf43e4e8'
          '78f66dd1aea062bbe8a7ac948b66e9914aeaac9d'
          'ef315dab623a0539dd1919bf983473150de1002c'
          'd645b34f08693c5e9814f0f023288b780dca7471'
          '59bf9af96487b4d90926acfd6df9242504465b58'
          'b33f4c138ac14edfab8e1b2781a93a67ff006a7a'
          '5e55d197549a119d21d48f3e29c6d9c04b4f45a1'
          '00fd22f20920efa8e76e37e53485d3aaf7c38582'
          '8cf65c3d546dc3e3ba548ef1c0ff0c08f9cf01f8'
          'f7e10f36d1443821130fd7e0936ea162d32870ce'
          'e7800e9ffc3760dd89ba49e4fba4d67c1e78b12b'
          'f871d58606edd0d3155ef1a6dfc7e712e7ae0e76'
          '5d1640317226f5a43459fbac43309a1d660db012'
          'bc08bda973ee77c97a6932548523d69822e26ee0')


package() {
  install -Dm644 ${pkgname}.xml "${pkgdir}"/usr/share/mime/packages/archpkg.xml
  install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
  install -d "${pkgdir}"/usr/share/${pkgname}
  install -m644 *.svgz "${pkgdir}"/usr/share/${pkgname}/
}


# vim: set et sts=2 sw=2 ts=2 :

