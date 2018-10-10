# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Martin Miller <witsquash at lavabit dot com>
# Contributor: Christian Holme <cholme at gmx dot com>

pkgname=idlex
pkgver=1.18
pkgrel=1
pkgdesc="Extensions to IDLE, the Python IDE"
arch=('any')
url="http://idlex.sourceforge.net/"
license=('NCSA')
depends=('python')
options=(!emptydirs)
source=("https://downloads.sourceforge.net/project/idlex/$pkgname-$pkgver.zip")
md5sums=('9efbaa83eebb95a50369028fb00a1ab9')


build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

