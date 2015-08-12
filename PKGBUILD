#Autor: Alexandre Minoshi(Almin-Soft Group)
#Maintainer: Alexandre Minoshi

pkgname=ssx
pkgver=2.2
pkgrel=2
pkgdesc="A graphical frontend for su/sudo (X11)"
options=('!strip')
arch=('i686' 'x86_64')
url="http://almin-soft.ru/index.php?programmy/ssx/tags/ssx"
license=('GPL2')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('lib32-libx11' 'lib32-gcc-libs')
elif [ "${CARCH}" = 'i686' ]; then
depends=('libx11' 'gcc-libs')
fi

optdepends=('sudo: Give certain users the ability to run some commands as root')
source=("ssx.tar.bz2::http://almin-soft.fsay.net/data/files/ssx/download.php?get=ssx.tar.bz2")

package() {
  install -Dm755 ssx $pkgdir/usr/bin/ssx
}
md5sums=('dad1cbb1a4bd001ade7f30d9603dfbde')
