# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=duniterpy
pkgname=python-$_pkgname

pkgver=0.55.1
pkgrel=1
pkgdesc="Python APIs library to implement Duniter clients software"

url='https://git.duniter.org/clients/python/duniterpy'
arch=('any')
license=('GPL3')

provides=('duniterpy')
depends=('python' 'python-aiohttp' 'python-scrypt' 'python-libnacl' 'python-base58' 'attr')

source=("https://git.duniter.org/clients/python/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha1sums=('e8bb884d8203f03cc8450ab4b785ec5d4906d565')

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
