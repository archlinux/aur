# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-alchemical-analysis
pkgver=1.0.1
pkgrel=2
pkgdesc="An open tool implementing some recommended practices for analyzing alchemical free energy calculations"
arch=('i686' 'x86_64')
url="https://github.com/MobleyLab/alchemical-analysis"
license=('LGPL')
depends=('python2' 'python2-pymbar')
source=(https://github.com/MobleyLab/alchemical-analysis/archive/v${pkgver}.tar.gz)
sha512sums=('0d3b50f78c67b76fc1d18ea96e764fe79f447aa372ed5c3aa986e9dfe77b072e022f7e6717a930ae7c327343fe523ea2d7be4ca502ced07294d20d457f83fa97')

package() {
  cd "$srcdir/alchemical-analysis-${pkgver}"
    python2 setup.py install -O2 --root=$pkgdir || return 1
}
