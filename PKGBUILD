# Maintainer: Vonpupp <vonpupp@gmail.com>
# Contributor: Pawel (Smeagol) Bogut <aur(at)smg.int.pl>

pkgname=gmote-server
pkgver=2.0.0
pkgrel=2
pkgdesc="Server for Gmote (Android Remote). Gmote turns your Android phone into a remote control for your computer."
arch=('any')
url="http://www.gmote.org/server"
license="APACHE"
depends=('java-runtime' 'vlc')
source=(http://sites.google.com/site/marcsto/GmoteServerLinux${pkgver}.tar.gz gmote.desktop gmote.png)
md5sums=('e59973552a2fa388a895e0d6ba154ea8' 'a224fb4f318bc64507d3c6919117fbcb' '5a36f7480c5d98161a1890dc37950763')

package() {
  cd ${srcdir}/GmoteServerLinux${pkgver}
  mkdir -p ${pkgdir}/opt/gmote/ 
  cp * ${pkgdir}/opt/gmote/ -fr
  mkdir -p ${pkgdir}/usr/share/applications/
  cp ../gmote.desktop ${pkgdir}/usr/share/applications/
  cp ../gmote.png ${pkgdir}/opt/gmote/
}

