pkgname=python-uiutil
pkgver=1.36.3
pkgrel=1
pkgdesc="Utility module to assist creating Tk GUIs"
arch=(any)
url="https://bitbucket.org/daycoder/uiutil"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python-pillow')
source=("https://pypi.io/packages/source/u/uiutil/uiutil-$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd uiutil-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
