# Maintainer: Hannaeko <tech+aur@hannaeko.eu>

pkgname=tumelune-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='a simple program to browse and search in twitter and mastodon archives'
arch=(x86_64)
license=(unknown)
url=https://fedi.doom.solutions/tumelune/
provides=(tumelune)
conflicts=(tumelune)
source=("https://fedi.doom.solutions/tumelune/files/tumelune-v${pkgver}-linux-x64.bin" tumelune.desktop tumelune.png )
sha256sums=('09d4d6ca6541322354edeb0503e89a935a9e57f2e9f7d0d1d91f1e6ea9359145'
            'e444a2095820b3ca1105a78ffff81bfc1d51cda2fd85a9fbcaf7d4427fc37515'
            '0ff4d4976cb12e860826ea4b037348bbab6401bcee169ae698d32c48b0e13ee2')

package() {
    install -Dm755 tumelune-v${pkgver}-linux-x64.bin "${pkgdir}/usr/bin/tumelune"
    install -Dm644 tumelune.desktop "${pkgdir}/usr/share/applications/tumelune.desktop"
    install -Dm644 tumelune.png "${pkgdir}/usr/share/icons/tumelune.png"
}
