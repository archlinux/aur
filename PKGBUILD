# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=pass-coffin
pkgver=1.0
pkgrel=1
pkgdesc="A password store extension that hides data inside a GPG coffin"
arch=(x86_64)
url="https://github.com/ayushnix/pass-coffin"
license=('GPL')
depends=('pass'
         'tar')
conflicts=('pass-coffin-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b2c3e88f900085a86a483a16fd0472f087c571fd2d778ac9a4513e1398a7d53')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
