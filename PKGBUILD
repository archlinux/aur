# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jka-toolkit
pkgver=0.2.7
pkgrel=2
pkgdesc="Set of scripts to optimize the daily work in linux shell (jkazip and apw)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip')
provides=('jkazip' 'apw')
options=(!emptydirs)
install=$pkgname.install
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit.tar.gz)
md5sums=('51617d9917a3b12feba935ab56cb450d')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  install -Dm755 * "$pkgdir/usr/bin/" 
}
