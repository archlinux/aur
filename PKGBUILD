pkgname=atha
pkgver=2.0.2
pkgrel=1
pkgdesc="Lightweight package manager wrapper for Arch Linux"
arch=('any')
url="https://github.com/Bangkah/Atha"
license=('MIT')
conflicts=('atha')
replaces=('atha')

depends=('bash' 'pacman' 'sudo' 'git' 'base-devel')

source=("https://github.com/Bangkah/Atha/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('SKIP')

package() {
    cd "$srcdir/Atha-${pkgver}"

    install -Dm755 atha "$pkgdir/usr/bin/atha"

    install -d "$pkgdir/usr/lib/atha"
    cp -r commands "$pkgdir/usr/lib/atha/"
}