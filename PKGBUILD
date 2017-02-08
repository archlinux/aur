# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-momoko
pkgver=2.2.4
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=("any")
url="http://momoko.61924.nl"
license=("MIT")
depends=("python" "python-tornado" "python-psycopg2")
makedepends=("python-setuptools")
source=("https://github.com/FSX/momoko/archive/v$pkgver.tar.gz")
sha1sums=("89de0eef8e23006e39f24db86b470b35c8eba97b")

build() {
    cd $srcdir/momoko-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/momoko-$pkgver
    python setup.py install --root="$pkgdir"
}
