# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Francois Garillot <francois[at]garillot.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=demjson
pkgver=2.2.4
pkgrel=2
pkgdesc="Encoder, decoder, and lint/validator for JSON (JavaScript Object Notation) compliant with RFC 7159"
arch=('any')
url="https://github.com/dmeranda/demjson"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
provides=('python-demjson')
conflicts=('nodejs-jsonlint')
sha256sums=('31de2038a0fdd9c4c11f8bf3b13fe77bc2a128307f965c8d5fb4dc6d6f6beb79')
source=("https://files.pythonhosted.org/packages/96/67/6db789e2533158963d4af689f961b644ddd9200615b8ce92d6cad695c65a/$pkgname-$pkgver.tar.gz")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 || return 1
}
