# Maintainer: Mark Huo <markhuomian at gmail dot com>
pkgname=python-progress
_pkgname=progress
pkgver=1.2
pkgrel=1
pkgdesc="Easy to use progress bars for Python"
arch=('any')
url="https://pypi.python.org/pypi/progress"
license=('ISC')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5b6a50f9ac76820f619d7789b5354881c8c10060a64047e415868d8f503cc2eb')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
