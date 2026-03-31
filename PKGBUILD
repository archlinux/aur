pkgname=atha
pkgver=1.0
pkgrel=1
pkgdesc="Simple package manager wrapper for Arch Linux"
arch=('any')
url="https://github.com/Bangkah/Atha"
license=('MIT')

depends=('bash' 'pacman')

source=("https://github.com/Bangkah/Atha/archive/refs/heads/main.tar.gz")

sha256sums=('SKIP')

package() {
    cd "$srcdir/Atha-main"

    install -Dm755 atha "$pkgdir/usr/bin/atha"

    install -d "$pkgdir/usr/lib/atha"
    cp -r commands "$pkgdir/usr/lib/atha/"
}