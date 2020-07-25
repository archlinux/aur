# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-ginga
pkgver=3.1.0
pkgrel=1
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('x86_64')
url="https://ejeschke.github.io/ginga/"
license=('BSD')
depends=('python'
         'python-astropy'
         'python-matplotlib'
         'python-scipy'
         'python-qtpy')
source=("https://files.pythonhosted.org/packages/source/g/ginga/ginga-${pkgver}.tar.gz")
md5sums=('35f509de0a33341bcba16054eb25ed30')

package(){
  cd $srcdir/ginga-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --use-system-libraries --offline
}
