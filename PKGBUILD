# Maintainer: jakob <grandchild@gmx.net>
# Contributor: TrialnError <autumn-wind@web.de>
# Contributor: ser <arch@random.re>

_pipname=flask-bcrypt
pkgname=python-flask-bcrypt
pkgver=0.7.1
pkgrel=3
pkgdesc="Bcrypt hashing for Flask"
arch=('any')
url="http://flask-bcrypt.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-flask' 'python-bcrypt')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maxcountryman/flask-bcrypt/archive/${pkgver}.tar.gz")
md5sums=('52747432432d6057fac3ed365c13a466')

package() {
    cd $_pipname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
