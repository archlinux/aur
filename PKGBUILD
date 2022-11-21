# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-defusedxml
pkgver=0.7.1
pkgrel=4
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://bitbucket.org/tiran/defusedxml'
license=('Python')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/d/defusedxml/defusedxml-$pkgver.tar.gz")
sha512sums=('93c1e077b22a278011497f3b3f4409b5259e0077768caa121e0f078f80f39c082f3870eaaf4bad5166fe8c3b2d169ccdea62c2840ba6969240a8371cef34c4d5')

package() {
  cd defusedxml-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
