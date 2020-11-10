# Maintainer:  Hao Long <aur at esd dot cc>
# Contributor: Boudewijn van Groos <github dot com slash Boudewijn26>
# Contributor: Tembleking <tembleking at gmail dot com>

_name=gTTS-token
pkgname=python-gtts-token
pkgver=1.1.4
pkgrel=1
pkgdesc="A python implementation of the token validation of Google Translate"
arch=('any')
url="https://github.com/Boudewijn26/gTTS-token"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e1c022453fe599655444f5c47c423448d3e38c582d3e6e6328641d582ae0a1bf')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
