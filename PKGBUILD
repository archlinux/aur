# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=wessus
pkgver=1.1
pkgrel=0
pkgdesc="Wessus identifies vulnerabilities in websites identifying technologies and checking related CVE for the specific version."
url="https://gitlab.com/brn1337/wessus"
license=('CC BY-NC-SA 4.0')
arch=('any')
depends=('npm' 'python' 'chromium')
makedepends=('make')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
    cd $srcdir/$pkgname-$pkgver
    make PREFIX=$pkgdir/usr install
}