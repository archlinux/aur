# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-blessings
_pkgname=blessings
pkgver=1.7
pkgrel=9
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
url="https://github.com/erikrose/blessings"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-distribute')
#options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('98e5854d805f50a5b58ac2333411b0482516a8210f23f43308baeb58d77c157d')

package() {
  cd "$srcdir/blessings-$pkgver"
  python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-blessings/LICENSE"
}
