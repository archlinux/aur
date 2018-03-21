pkgname=spotifyd-bin
pkgver=20180320
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-f40914fedc45c74a3412/spotifyd-2018-03-20-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('ad62824b7cd43b5ecd4780e828e01df0f4497a7efb66093289c38cacb4349964'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('20e0802c40ab5810ba6a89b9cdce9a293b8ed8f1c5541cb1508ca41a5ea8a4d0'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-f40914fedc45c74a3412/spotifyd-2018-03-20-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
