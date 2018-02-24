# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-wsproto')
_pkgname='wsproto'
pkgver='0.11.0'
pkgrel='1'
pkgdesc='WebSockets state-machine based protocol implementation'
arch=('any')
url="https://github.com/python-hyper/wsproto"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-h11')
source=("https://pypi.python.org/packages/8a/8e/65017baa6a398f93866c68054ce797aef1a8b10793c94d8653f70e8ad613/wsproto-$pkgver.tar.gz")
md5sums=('d75d9fe117cad031f3429a4f916d065c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
