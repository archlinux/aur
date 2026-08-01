# Maintainer: willcannotcode <william@moulder.com>
pkgname=cetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A horizontally centered, modern fetch tool"
arch=('any')
url="https://github.com/willcannotcode/cetch"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('daf64bd8c09c7f296da7a07ea933886c59360e3133cb7929d0828a1bc7edb373')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 cetch.sh "$pkgdir/usr/bin/cetch"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
