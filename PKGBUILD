# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.0~beta.6.2
pkgrel=1
pkgdesc="iOS 15.0-16.4.1 semi-tethered checkm8 jailbreak"
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.6.2/palera1n-linux-x86_64"
        "https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.6.2/palera1n.1")
sha256sums=('c4d92454c2ed52b58cb0115d8660682b20335d9721b685f0ae27eacbebb252e2'
            'aed0e6d47e2dbdc96c5051973fb8419d4a82248ce33b7c268113c038a7bc576d')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
