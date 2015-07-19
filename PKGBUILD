# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=python-pytimeparse
_pkgname=pytimeparse
pkgver=1.1.5
pkgrel=1
pkgdesc="A small Python library to parse various kinds of time expressions"
arch=('any')
url='https://github.com/wroberts/pytimeparse'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9addbd29ae638e610a78a3cb50371f2091938de89c1ab61fa9cde7556a18b207')

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}
