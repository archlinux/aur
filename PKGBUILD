# Maintainer: Giuliano Schneider <gs93@gmx.net>
# Contributor: Wei Dai <x at wei23 dot com>
pkgname=fasd
pkgver=1.0.1
pkgrel=1
pkgdesc='Command-line productivity booster, offers quick access to files and directories'
arch=('any')
url='https://github.com/clvv/fasd'
license=('MIT')
source=('https://github.com/clvv/fasd/tarball/1.0.1' fasd.install)
install='fasd.install'
md5sums=('5f1992f5e1eff96375ff50a1f82e92b4' '6a0330f84925563f739c4241fd36e41e')

package() {
  cd "$srcdir/clvv-fasd-4822024"
  PREFIX="$pkgdir/usr" make install
}

