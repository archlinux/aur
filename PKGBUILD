# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.1
pkgrel=1
pkgdesc="Jailbreak for A8 through A11, T2 devices, on iOS/iPadOS/tvOS 15.0, bridgeOS 5.0 and higher."
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v"${pkgver}"-beta.2/palera1n-linux-x86_64"
        "https://cdn.nickchan.lol/palera1n/c-rewrite/releases/v"${pkgver}"-beta.1/docs/palera1n.1")
sha256sums=('d0ba1cc315523703a7f61e6ba6687ee166e7ac319d36f71b1e79f273180d0738'
            '575b0606051124175ea8e4c52c4a5e4c33ccbf43fd1eda07c797cdcd2308bed3')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "${pkgdir}/usr/bin/palera1n"
    install -Dm644 "palera1n.1" "${pkgdir}/usr/share/man/man1/palera1n.1"
}
