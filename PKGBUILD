# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=python-aur
pkgver=0.10.0
pkgrel=1
pkgdesc='Arch User Repository API interface for Python'
arch=('any')
url='https://github.com/cdown/aur'
license=('ISC')
depends=('python-requests' 'python-inflection')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/aur/aur-$pkgver.tar.gz)
md5sums=('fad8a5a1ff35f30c14a7b75a9258dafb')

package() {
  cd aur-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
