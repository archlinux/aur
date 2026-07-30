# Maintainer: willcannotcode <william@moulder.com>
pkgname=cetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A horizontally centered, modern fetch tool"
arch=('any')
url="https://github.com/willcannotcode/cetch"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('700dcdd50b9fed9315162fc229b8811b0127e4523d39a322feaa5b3f5b9ee77f')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 cetch.sh "$pkgdir/usr/bin/cetch"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
