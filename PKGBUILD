pkgname=spotifyd-bin
pkgver=20180503
pkgrel=1
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-7cf7ff718c3f15a28c1e/spotifyd-2018-05-03-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('94feccabf08f31e438d9faf35b7c31e50286ba2e1d405ef869e96eb51738dcb1'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('ab4cc4048678386f58e49a6ee98c23bbc1227617b12788edd0d16e0255c43d57'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-7cf7ff718c3f15a28c1e/spotifyd-2018-05-03-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
