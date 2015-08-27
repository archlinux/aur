# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: rayte <rabyte__gmail>
# Contributor: aldeano <aldea.diaguita at gmail.com>

pkgname=python2-cerealizer
pkgver=0.8
pkgrel=2
pkgdesc="A Python module for saving objects in a file [Python 2]"
arch=('any')
url="http://home.gna.org/oomadness/en/cerealizer/"
license=('PSF')
depends=('python2')
source=(http://download.gna.org/soya/Cerealizer-$pkgver.tar.bz2)
md5sums=('91bc8d5f5d75525364377051fd5e8b72')

package() {
  cd "$srcdir/Cerealizer-$pkgver"

  python2 "$(pwd)/setup.py" install --root="$pkgdir"
}
