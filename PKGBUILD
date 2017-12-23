# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=jaconv
pkgname=python-jaconv
pkgver=0.2.1
pkgrel=1
pkgdesc="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
arch=('any')
url="https://github.com/ikegami-yukino/jaconv"
license=('MIT')
depends=('python')

source=("https://pypi.python.org/packages/2f/34/2607cba25002428fec4ecf1071364624e881eb03c1e0c7a2fdf4699e99b3/$_realname-$pkgver.tar.gz")
md5sums=('4b13d910f93a429a62fa03a00d30545d')

package() {
  cd $_realname-$pkgver
  python setup.py install --root="$pkgdir"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 README.rst README_JP.rst "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
