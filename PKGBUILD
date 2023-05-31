# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.0~beta.7
pkgrel=1
pkgdesc="iOS 15.0-16.6 semi-tethered checkm8 jailbreak"
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.7/palera1n-linux-x86_64"
        "https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.7/palera1n.1")
sha256sums=('24c04e9619547b699b3cad54622ecbcbc3ca53516f4369cdcd3ccf39cf3fff76'
            '1700405e12e4bd01955593566c972d6e427f324762988727cf6728db6b26440d')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
