pkgname=langman
pkgver=1.0
pkgrel=1
pkgdesc="Single-binary doc viewer"
arch=('x86_64')
license=('GPL2')
makedepends=('gcc') 
depends=('glibc')

build() {
    gcc -O3 main.c -o langman
}

package() {
    install -Dm755 langman "$pkgdir/usr/bin/langman"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
