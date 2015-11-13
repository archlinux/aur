# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>

pkgname=python-stscitools
pkgver=2.1.9
pkgrel=1
pkgdesc="STSCI Tools"
arch=('i686' 'x86_64')
depends=('python')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(http://stsdas.stsci.edu/download/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')
md5sums=('8e9d5ed2dd459d521c8fb8c2f20ab3a4')

package() {
  cd $srcdir/pyraf-$pkgver/required_pkgs/stsci.tools/
  python setup.py install --root $pkgdir
}
