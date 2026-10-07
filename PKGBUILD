# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.4
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v"${pkgver}"/palera1n-linux-x86_64"
        "https://cdn.nickchan.lol/palera1n/c-rewrite/releases/v"${pkgver}"/docs/palera1n.1")
sha256sums=('ea531df933c0c8edab25ecb8f43faedd010177484482bb3744eaa4cf1cd48658'
            '4d7ecee9f0f2235b8a26fa3e95569fae2943cdbb0222978ce861d4b5850b9624')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "${pkgdir}/usr/bin/palera1n"
    install -Dm644 "palera1n.1" "${pkgdir}/usr/share/man/man1/palera1n.1"
}
