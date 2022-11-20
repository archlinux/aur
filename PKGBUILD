# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python38-wcwidth
_name=wcwidth
pkgver=0.2.5
pkgrel=6
pkgdesc="Measures number of Terminal column cells of wide-character codes"
url="https://github.com/jquast/wcwidth"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83')

package() {
  cd "$srcdir/$_name-$pkgver"
  python3 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
