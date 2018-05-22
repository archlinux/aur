pkgname=spotifyd-bin
pkgver=20180522
pkgrel=1
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-c16e4f3b11b9c06ccf49/spotifyd-2018-05-22-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('ac1362d28b70d09c7e6e23d3c12e565b1d358e9fc40c8703f64fe3c222d31631'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('0b9de9fbe7f6681cbced127b5e33233ee71abc0141efcb077d8bce5459fd65d8'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-c16e4f3b11b9c06ccf49/spotifyd-2018-05-22-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
