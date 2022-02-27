# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=pass-coffin
pkgver=1.2.0
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
sha256sums=('f0418edf9ceb34139d9591fbf791a320e6f749f72076b99c9d799d263f894855')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
