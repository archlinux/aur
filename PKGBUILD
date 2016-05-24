# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jka-toolkit
pkgver=0.2.5
pkgrel=2
pkgdesc="Set of scripts to optimize the daily work in linux shell (jkazip and apw)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip' 'zip' 'facter')
provides=('jkazip' 'apw')
options=(!emptydirs)
install=$pkgname.install
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit.tar.gz)
md5sums=('2f2d776a4201f0628cae8c0ea0e12d22')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  install -Dm755 * "$pkgdir/usr/bin/" 
}
