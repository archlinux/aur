pkgname=spotifyd-bin
pkgver=c97ae6f8b1e521f55518
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-13-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('e00c21315b723c7c23e0100c4349449136b4f08f8471b18320ff4235fb59455d'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('8dc7a54241dca17ae50628b506f19daf785856071d92cfcfc08ebd30d030afa6'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-13-armv7.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
