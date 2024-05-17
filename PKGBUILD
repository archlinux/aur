# Maintainer: Klod Cripta <KlodCripta@linux.it>
pkgname=cleaner-advanced
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple system cleaning program for Arch Linux"
arch=('any')
url="https://github.com/KlodCripta/Cleaner-Advanced"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KlodCripta/Cleaner-Advanced/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cleaner_advanced.sh "$pkgdir/usr/bin/cleaner_advanced"
    install -Dm644 cleaner_advanced.desktop "$pkgdir/usr/share/applications/cleaner_advanced.desktop"
}
