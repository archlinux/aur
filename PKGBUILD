pkgname=addic7ed-cli
pkgver=1.4
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

md5sums=('44a4a88a65a170c9ce902037ac730206')
