pkgname=is-my-code-cursed
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI Tool That Roasts Your Code Using AI"
arch=('any')
url="https://github.com/HimC29/is-my-code-cursed"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fa307324b2629006084bef8881b524694bada8feec1d48283b59f2e1a1b42f39')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/main.py "$pkgdir/usr/bin/is-my-code-cursed"
}
