# Maintainer: willcannotcode <william@moulder.com>
pkgname=cetch
pkgver=1.5.0
pkgrel=1
pkgdesc="A horizontally centered, modern fetch tool"
arch=('any')
url="https://github.com/willcannotcode/cetch"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0e645a466c5bcf83a5dcb26cc77b534df7a357866fd2839fd8167ae5b815745')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 cetch.sh "$pkgdir/usr/bin/cetch"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
