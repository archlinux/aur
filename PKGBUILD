# Maintainer: ParkerMc <boebugs@kalman98.net>
pkgname=boe-server
pkgver=0.1.1
pkgrel=1
pkgdesc="A chat platform that intends to look at other chat programs and take only the Best of Everything."
arch=('x86_64' 'i686')
url="https://github.com/ParkerMc/BOE"
license=('GPL-3')
groups=()
depends=('python2-passlib' 'python2-pyqt4' 'python2')
source=("https://downloads.sourceforge.net/boe/0.1.1/BoE-Linux0.1.1.tar.gz")
md5sums=('155c1f0f08ba677072ccc7a0850cff9f')

package() {
  rm -R usr/lib/boe/client
  rm usr/bin/boe
  rm -R usr/share/
  cp -R usr/ $pkgdir
}
