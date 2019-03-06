# Maintainer: Justin Benge <justinbng36@gmail.com>

pkgname=python-remoto
_pkgname=remoto
pkgver=1.1.0
pkgrel=1
pkgdesc="A very simplistic remote-command-executor using connections to hosts"
arch=(any)
url="https://pypi.org/project/$_pkgname/$pkgver/"
license=('MIT')
depends=('python')
makedepends=('git')
source=("https://files.pythonhosted.org/packages/8a/76/0eee00bc1de7a047e4bb3047ade022fae7e7c2c80ffc6401ef71c700d31c/$_pkgname-$pkgver.tar.gz")
sha256sums=('3e9d9898b88b5993df985bad22382df0fbd9ecb3ca8052e2443f81b5a0eb521a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

