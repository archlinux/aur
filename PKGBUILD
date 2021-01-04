# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.1.0
pkgrel=1
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
groups=()
depends=()
makedepends=("zig>=0.7.0", "zig<=0.7.1")
source=("https://github.com/shtanton/$pkgname/archive/$pkgver.tar.gz")
md5sums=("a44a6de8374ba98122eff6ed0319b758")

package() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-small -Dstrip --prefix "${pkgdir}/usr" install
}
