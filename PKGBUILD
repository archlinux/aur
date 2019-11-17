# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-webpagecache
pkgver=1.0.1
pkgrel=2
pkgdesc="A utility class for downloading webpages and storing them in an SQLite3 database as a cache."
arch=("any")
url="https://github.com/djmattyg007/python-webpagecache"
license=("Unlicense")
depends=("python" "python-requests" "python-wire")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/python-webpagecache/archive/${pkgver}.tar.gz")
sha256sums=("b1dd14eb05ff22d4ddf3a0790d14250537db78ae181812ab05491f637df5af7c")

package() {
    cd "python-webpagecache-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-webpagecache/LICENSE.txt"
}
