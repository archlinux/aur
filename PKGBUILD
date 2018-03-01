pkgname=spotifyd-bin
pkgver=49c75d3077998929f42e
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-49c75d3077998929f42e/spotifyd-2018-02-28-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('966ddc7e9fba7a921f3e0103410661648634bd6a578edeb91782953f02cbca6e'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('0533fa33a84eaa55abc95b4204de994802efb086e0d9cf85079fbfeb05a41486'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-49c75d3077998929f42e/spotifyd-2018-02-28-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
