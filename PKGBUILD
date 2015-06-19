# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-alchemical-analysis
pkgver=1.0.1
pkgrel=1
pkgdesc="An open tool implementing some recommended practices for analyzing alchemical free energy calculations"
arch=('i686' 'x86_64')
url="https://github.com/MobleyLab/alchemical-analysis"
license=('LGPL')
depends=('python2' 'python2-pymbar')
source=(https://github.com/MobleyLab/alchemical-analysis/archive/v${pkgver}.tar.gz)
md5sums=('c4a550ac1bf983d4286909ffc2e6ebd0')

package() {
  cd "$srcdir/alchemical-analysis-${pkgver}"
    python2 setup.py install --root=$pkgdir || return 1
}
