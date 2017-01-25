# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.10.3
pkgrel=1
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='https://gtimelog.org/'
license=('GPL')
depends=('python' 'python-gobject' 'python-setuptools')
source=("https://pypi.python.org/packages/72/3c/a3dd5364801a891035cac55a74dbe6a95cd9a0824f89ca5a2126770636d5/$pkgname-${pkgver}.tar.gz")
md5sums=('7171f60fd4c8299fda3904320e2034d2')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
