# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-coffin
pkgver=1.0.1
pkgrel=1
pkgdesc="A password store extension that hides data inside a GPG coffin"
arch=(x86_64)
url="https://github.com/ayushnix/pass-coffin"
license=('GPL')
depends=('pass'
         'tar')
conflicts=('pass-coffin-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('405b1137dc1350924828751c0369f25b19cb07d476538f903ab41ce7c0b39822')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
