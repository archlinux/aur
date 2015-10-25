pkgname=d2clr-git
pkgver=2015.10.25
pkgrel=1
pkgdesc="Auto click button 'Accept' in Dota 2 game"
url="https://github.com/FTCr/d2clr"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc' 'dbus' 'xdotool')
source=("git://github.com/FTCr/d2clr.git")
md5sums=('SKIP')
package(){
  cd "${srcdir}/d2clr"
  make install PREFIX="${pkgdir}/usr"
}
