# Maintainer: jamazi <jamazi@tutanota.com>

pkgname=nrich-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool to quickly analyze all IPs in a file and see which ones have open ports/ vulnerabilities."
arch=("x86_64")
url="https://gitlab.com/shodan-public/nrich"
license=('GPL3')
depends=(openssl-1.1 glibc)
provides=(nrich)
source=("https://gitlab.com/api/v4/projects/33695681/packages/generic/nrich/$pkgver/nrich-linux-amd64"
        "https://gitlab.com/shodan-public/nrich/-/raw/$pkgver/README.md")
sha256sums=("6f223ac20f7fb6e959bdcaec22eb3373d1b4ab27ac0a9d678a3cad99a5ab564a"
            "SKIP")

package() {
    install -Dm755 "$srcdir/nrich-linux-amd64" "$pkgdir/usr/bin/nrich"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/nrich/README.md"
}
