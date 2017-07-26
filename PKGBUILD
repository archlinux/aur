pkgname=spotifyd-bin
pkgver=9611d797f6d3344e6a8e
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-22-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('bf73cf4de962fe6b136e7105f303ef65ee753c79131f3ff0da93f51b7e51b761'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('10000435bbd4272b256124a0df012dcf3c40ca059d3b3bd67e853797ea89fc7d'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-07-22-armv7.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
