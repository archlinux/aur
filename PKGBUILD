pkgname=addic7ed-cli
pkgver=1.3
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
md5sums=('2d31652967e485ea876f07e6963bd9d9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
