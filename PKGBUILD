# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jka-toolkit
pkgver=0.2.7
pkgrel=1
pkgdesc="Set of scripts to optimize the daily work in linux shell (jkazip and apw)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip')
provides=('jkazip' 'apw')
options=(!emptydirs)
install=$pkgname.install
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit.tar.gz)
md5sums=('b3588bc1cdceca9356a88aeb17ae8159')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  install -Dm755 * "$pkgdir/usr/bin/" 
}
