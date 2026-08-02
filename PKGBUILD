# Maintainer: willcannotcode <william@moulder.com>
pkgname=cetch
pkgver=1.2.2
pkgrel=1
pkgdesc="A horizontally centered, modern fetch tool"
arch=('any')
url="https://github.com/willcannotcode/cetch"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee815f62d0fb77fb8e7180756744e887f9dc9d3df1b569d67ddd29014562c394')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 cetch.sh "$pkgdir/usr/bin/cetch"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
