# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=sshm
pkgver=1.1.0
pkgrel=1
pkgdesc="Interactive SSH Fuzzy Manager with Live Metadata Preview via fzf and ssh -G"
arch=('any')
url="https://github.com/zyekhabdul/sshm"
license=('MIT')
depends=('bash' 'openssh' 'fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5389f8a16944cafbe0fb440c6eb48b9a003e8a06996a526df8050089be789b35')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/sshm "$pkgdir/usr/bin/sshm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
