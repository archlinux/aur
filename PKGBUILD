# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>

pkgname=python-stscitools
pkgver=2.1.7
pkgrel=1
pkgdesc="STSCI Tools"
arch=('i686' 'x86_64')
depends=('python')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(http://stsdas.stsci.edu/download/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')
md5sums=('72c7529de63bd1d4cfe016e5253d0b8f')

package() {
  cd $srcdir/pyraf-$pkgver/required_pkgs/stsci.tools/
  python setup.py install --root $pkgdir
}
