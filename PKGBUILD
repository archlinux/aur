pkgname=is-my-code-cursed
pkgver=1.2.0
pkgrel=1
pkgdesc="A CLI Tool That Roasts Your Code Using AI"
arch=('any')
url="https://github.com/HimC29/is-my-code-cursed"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('74eccc769c647d1ac3e16904091d48bfe295d713a0b69d21caa869c49841c826')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/main.py "$pkgdir/usr/bin/is-my-code-cursed"
}
