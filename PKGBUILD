pkgname=seccheck
pkgver=1.0.0
pkgrel=1
pkgdesc="Security and integrity checker for Arch Linux with contextual analysis"
arch=('any')
url="https://github.com/KlodCripta/seccheck"
license=('MIT')
depends=('bash' 'rkhunter' 'lynis' 'pacman')
source=("https://github.com/KlodCripta/seccheck/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/seccheck-1.0.0"
    
    install -Dm755 seccheck.sh "$pkgdir/usr/bin/seccheck"
}
