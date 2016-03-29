pkgname=addic7ed-cli
pkgver=1.4.1
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
source=("https://github.com/BenoitZugmeyer/${pkgname}/archive/v${pkgver}.zip")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('63b00d24df71ea5fd7f4cabf6a390097')
