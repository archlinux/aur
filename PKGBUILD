pkgname=spotifyd-bin
pkgver=8746a31e8a06ca90a947
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-02-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('00aad7c0eafa9953cdfc1172de5506d623dc3a16ffd94f3e7d67f048011a7d80'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('8a26cecbb5da32a3b58872cd701a4b6a0a980dfbc1e0ee35000950385c9b17f3'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-02-armv7.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
