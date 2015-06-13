# Maintainer:Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=ryzom-data
pkgver=1200
pkgrel=4
pkgdesc="Ryzom game data sync"
arch=('any')
url="http://www.ryzom.com/"
license=('CCPL:by-sa')
depends=( 'rsync')
provides=('ryzom-data')
source=( 'ryzom_sync' )
md5sums=('7b1172e41d04483ff9d4762662e65a32')




package() {
  cd "$srcdir"
  mkdir -m664 -p ${pkgdir}/usr/share/ryzom
  chgrp games ${pkgdir}/usr/share/ryzom
  mkdir -p -m755  ${pkgdir}/usr/bin
  install -m754 -g games ryzom_sync "${pkgdir}/usr/bin"
}
