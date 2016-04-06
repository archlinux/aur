# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=luigi
pkgver=2.1.1
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
optdepends=('python-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f05aab98f4212d807b5ab348239058ec')
sha256sums=('c4ae2282a6eb36ecff56eb4425464485cc88fdcb57fbb9d8b08f02e96bc36bc5')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
