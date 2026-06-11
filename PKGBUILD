# Maintainer: Mark <inspace2025@mail.ru>

pkgname=papt2
conflicts=('papt' 'papt3')
provides=('papt')
pkgver=0.9.6.1
pkgrel=1
pkgdesc="pacman and yay wrapper with apt-like syntax for Arch Linux"
arch=('any')
url="https://github.com/MarkGMX8X/papt2"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('35b1d387874e1dc490e679f2385b970250f82ce824db4956337c8ddc31cfa03c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 papt "$pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
