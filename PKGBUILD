# Maintainer: Magnus Olsson <datamange at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python-instagram
pkgver=1.3.2
pkgrel=1
pkgdesc="Instagram API client"
arch=('any')
url="https://pypi.python.org/pypi/python-instagram"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/python-instagram/python-instagram-${pkgver}.tar.gz")
md5sums=('344652803cf0b2455e57e8c398f69666')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
