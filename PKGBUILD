# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=wallpaper-archpaint2
pkgver=1.1
pkgrel=3
pkgdesc="A Nice Archlinux Wallpaper"
arch=( 'any' )
url="http://www.archlinux.org/"
license=('CCPL:by-nc-sa')
install=wallpaper-archpaint2.install
source=("http://www.herecura.be/archlinux/${pkgname}/${pkgname}-${pkgver}.tar.bz2" )
sha256sums=('cf6b3e5da88525c51ef5bdd7beabd2f897bc9f946d46a4a8a5786a1a017f1a90')

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/archlinux/wallpaper

  install -m644 *.png ${pkgdir}/usr/share/archlinux/wallpaper/
}
