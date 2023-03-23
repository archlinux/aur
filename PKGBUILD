# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.0~beta.5
pkgrel=1
pkgdesc="iOS 15.0-16.3.1 semi-tethered checkm8 jailbreak"
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.5/palera1n-linux-x86_64"
        "https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.5/palera1n.1")
sha256sums=('1120432596a1d3c65195a602dc55e7f5719f9232c51ee548c92d4ea05057a3bd'
            '9a9f6f9ba7ff51b1baba45797aa5ba1f45d49aa009db87573f2c0cbdefaa9d95')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
