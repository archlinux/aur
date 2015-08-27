pkgname=d2clr-git
pkgver=2014.12.18
pkgrel=1
pkgdesc="Auto click button 'Accept' in Dota 2 game"
url="https://github.com/FTCr/d2clr"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc' 'dbus' 'xdotool')
source=("git://github.com/FTCr/d2clr.git")
md5sums=('SKIP')
build(){
  cd "${srcdir}/d2clr"
  make install PREFIX="${pkgdir}/usr"
}
