pkgname=is-my-code-cursed
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI Tool That Roasts Your Code Using AI"
arch=('any')
url="https://github.com/HimC29/is-my-code-cursed"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d268a308352c129b7a480f194b6324576ca17114dbc79a24c373a46d2a883df4')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/main.py "$pkgdir/usr/bin/is-my-code-cursed"
}
