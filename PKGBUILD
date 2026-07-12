# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.3
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v"${pkgver}"/palera1n-linux-x86_64"
        "https://cdn.nickchan.lol/palera1n/c-rewrite/releases/v"${pkgver}"/docs/palera1n.1")
sha256sums=('037c2b398bc13bab277ae9abb841ae3c5c5bc89e22332bbcbcd8d04b68214292'
            '621d23a444579ce3491b9273d2d0401b3ec0801d3e3f78eb6c465c376493d219')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "${pkgdir}/usr/bin/palera1n"
    install -Dm644 "palera1n.1" "${pkgdir}/usr/share/man/man1/palera1n.1"
}
