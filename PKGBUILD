# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.2.1
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v"${pkgver}"/palera1n-linux-x86_64"
        "https://cdn.nickchan.lol/palera1n/c-rewrite/releases/v"${pkgver}"/docs/palera1n.1")
sha256sums=('a236c40697238df029e9ba9b34c61f9652350332d143e4effef3bdb896ba3151'
            'f38a45295f934ab42e3851d6a80a8256f9ff8b710024c134d3bfce4de399881c')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "${pkgdir}/usr/bin/palera1n"
    install -Dm644 "palera1n.1" "${pkgdir}/usr/share/man/man1/palera1n.1"
}
