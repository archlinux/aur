# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-ginga
pkgver=3.0.1
pkgrel=2
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
md5sums=('20a3ea7f5fcefdd4bf036ad213808470')

package(){
  cd $srcdir/ginga-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --use-system-libraries --offline
}
