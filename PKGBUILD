pkgname=addic7ed-cli
pkgver=1.2
pkgrel=1
pkgdesc="Addic7ed command-line interface"
arch=('any')
url="https://github.com/BenoitZugmeyer/addic7ed-cli"
license=('Expat')
groups=()
depends=('python'
         'python-pyquery'
         'python-requests'
         'python-setuptools')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://github.com/BenoitZugmeyer/${pkgname}/archive/v${pkgver}.zip")
md5sums=('64922ea0d385dda36fe5c04494cde404')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
