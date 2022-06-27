# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=pass-coffin
pkgver=1.2.1
pkgrel=1
pkgdesc="A password store extension that hides data inside a signed and encrypted coffin"
arch=(any)
url="https://github.com/ayushnix/pass-coffin"
license=('GPL')
depends=('pass'
         'tar'
         'findutils')
conflicts=('pass-coffin-git'
           'pass-tomb'
           'pass-tomb-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bca41b9c9dc3525ddfccef31baef2c61366a968c43ee841c3b6c6934e3263fbe')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
