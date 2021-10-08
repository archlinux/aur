# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-coffin
pkgver=1.1
pkgrel=1
pkgdesc="A password store extension that hides data inside a GPG coffin"
arch=(x86_64)
url="https://github.com/ayushnix/pass-coffin"
license=('GPL')
depends=('pass'
         'tar')
conflicts=('pass-coffin-git'
           'pass-tomb'
           'pass-tomb-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca728dccd369cc542d97a9a6ee5aa71f86a023f1fb121c9a92ac45440083c7f0')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
