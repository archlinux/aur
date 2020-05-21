# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=silkaj

pkgver=0.7.6
pkgrel=1
pkgdesc="Powerfull, lightweight, and multi-platform command line client written with Python for Duniter’s currencies"

url='https://git.duniter.org/clients/python/silkaj'
arch=('any')
license=('GPL3')

provides=('duniterpy')
depends=('python' 'python-setuptools' 'python-dephell' 'python-click' 'python-ipaddress' 'python-texttable' 'python-tabulate' 'python-pynacl')

source=("https://git.duniter.org/clients/python/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('69074ddf804d79a2780bb757d0fcab8c08ec63478b215b842e536327348e4a02369b69e5c07b61dbf6245b4cf99847b583b4be853b469503ad1688aaf4732656')

package() {
    cd "$pkgname-v$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
