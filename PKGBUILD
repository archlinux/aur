# Maintainer:  Boudewijn van Groos <github dot com slash Boudewijn26>
# Contributor: Tembleking <tembleking at gmail dot com>

pkgname=python-gtts-token
pkgver=1.1.2
pkgrel=1
pkgdesc="Token for gTTS"
arch=('any')
url="https://github.com/Boudewijn26/gTTS-token"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'unzip')
source=("$pkgname::https://files.pythonhosted.org/packages/5a/81/b54c771ee6a78bdb6aebc274d7a806ad1f8761462f3592f3781d5cd9046f/gTTS-token-1.1.2.tar.gz")
md5sums=('9f0599bd1433551422427b4da6b2318f')

build() {
  cd "$srcdir/gTTS-token-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-token-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
