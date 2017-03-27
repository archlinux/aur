# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=python-ginga
pkgver=2.6.2
pkgrel=3
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('i686' 'x86_64')
url="http://ejeschke.github.io/ginga/"
license=('BSD')
depends=('python'
         'python-astropy'
         'python-astropy-helpers'
         'python-matplotlib'
         'python-scipy'
         'python-qtpy')
source=("https://files.pythonhosted.org/packages/source/g/ginga/ginga-${pkgver}.tar.gz")
md5sums=('a98559abd5532d41a7e6bd243bf9c1f3')

package(){
  cd $srcdir/ginga-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --use-system-libraries --offline
}
