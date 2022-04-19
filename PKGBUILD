# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-pythreadworker
pkgname='python-pythreadworker'
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/eight04/pyWorker"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6f493b0b80874544a9bff4b6f1ecb6fc1ded30dceb0e6f5ec37d9a1ee196934f98d30f1c3bc9e9ccd132fe48b592757873650d06eb53266b9564c55e5eca309d')

package() {
  cd pythreadworker-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
