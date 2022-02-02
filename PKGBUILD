# Maintainer: Bernhard Walle <bernhard.walle@posteo.eu>

pkgname=python-ping
_name=pythonping
pkgver=1.1.1
pkgrel=1
pkgdesc='PythonPing is simple way to ping in Python'
arch=('any')
url='https://pypi.org/project/pythonping/'
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0022f6cbe52762e9d596316e3bccb8a3b794355a49c0d788f7228d90f9461cfc')

build() {
  cd "pythonping-$pkgver"
  python setup.py build
}

package() {
  cd "pythonping-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
