# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.0~beta.9.2
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.9.2/palera1n-linux-x86_64"
        "https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.9.2/palera1n.1")
sha256sums=('3af3f9862e55bd90d132e8a5453e01454fac998aa9ca8269d65da920140c6deb'
            '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
