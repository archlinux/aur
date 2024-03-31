# Maintainer: jamazi <jamazi@tutanota.com>

pkgname=nrich-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A command-line tool to quickly analyze all IPs in a file and see which ones have open ports/ vulnerabilities."
arch=("x86_64")
url="https://gitlab.com/shodan-public/nrich"
license=('GPL3')
depends=(openssl-1.1 glibc)
provides=(nrich)
source=("https://gitlab.com/api/v4/projects/33695681/packages/generic/nrich/$pkgver/nrich-linux-x86_64"
        "https://gitlab.com/shodan-public/nrich/-/raw/$pkgver/README.md")
sha256sums=("8446c13f169056554e56fbaeb8a89fc747ba18712142c80733332e3b2fce7399"
            "SKIP")

package() {
    install -Dm755 "$srcdir/nrich-linux-x86_64" "$pkgdir/usr/bin/nrich"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/nrich/README.md"
}
