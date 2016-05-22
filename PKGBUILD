# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=jka-toolkit
pkgver=0.2.1
pkgrel=1
pkgdesc="Set of scripts to optimize the daily work in linux shell"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
depends=('p7zip' 'unrar' 'unzip')
options=(!emptydirs)
install=$pkgname.install
source=(https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit.tar.gz)
md5sums=('52bd478e4f1d86f6e69646a53db13224')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  install -Dm755 * "$pkgdir/usr/bin/" 
}
