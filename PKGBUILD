# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=silkaj

pkgver=0.7.3
pkgrel=1
pkgdesc="Powerfull, lightweight, and multi-platform command line client written with Python for Duniter’s currencies"

url='https://git.duniter.org/clients/python/silkaj'
arch=('any')
license=('GPL3')

provides=('duniterpy')
depends=('python' 'python-click' 'python-ipaddress' 'python-texttable' 'python-tabulate' 'python-pynacl')

source=("https://git.duniter.org/clients/python/$pkgname/-/archive/$pkgver/$pkgname-v$pkgver.tar.gz")
sha1sums=('9ea958666a86c9e2c83953d2685c456b72628e67')

package() {
    cd $pkgname-v$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
