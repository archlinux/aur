# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.2
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v$pkgver/palera1n-linux-x86_64"
        "https://cdn.nickchan.lol/palera1n/c-rewrite/releases/v$pkgver/docs/palera1n.1")
sha256sums=('eb019d2e1dbf3c3ee1f9c197c5161c2a941b20527aa55188a690fb1d28f3c418'
            'd4cde3379deb600d009c6e72e96ccb4f5a6220d4348fc31e3b4a2e5dab9327de')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
