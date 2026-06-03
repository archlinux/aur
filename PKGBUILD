# Maintainer: ChickenJockey7
pkgname=squish
pkgver=1.1.2
pkgrel=2
pkgdesc="A fast, lightweight Unix shell written in Cpp"
arch=('x86_64')
url="https://gitlab.com/cpp4692517/shell"
license=('MIT')
makedepends=('git' 'xmake' 'lua')
depends=('lua')
source=("git+https://gitlab.com/cpp4692517/shell.git")
sha256sums=('SKIP')

build() {
    cd shell
    xmake   
}

package() {
    cd shell
    xmake install -o "$pkgdir/usr/bin/"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
