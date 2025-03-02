# Maintainer: Ayumu <your.email@example.com>
pkgname=sysboost
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight Linux system optimizer and cleanup tool."
arch=('x86_64')
url="https://github.com/ayumu436/bash"
license=('MIT')
depends=('bash' 'curl')
source=("https://raw.githubusercontent.com/ayumu436/bash/main/sysboost.sh"
        "sysboost.1")
        
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/sysboost.sh" "$pkgdir/usr/bin/sysboost"
    install -Dm644 "$srcdir/sysboost.1" "$pkgdir/usr/share/man/man1/sysboost.1"
}
