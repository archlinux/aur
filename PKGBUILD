pkgname=spotifyd-bin
pkgver=20180526
pkgrel=1
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-4cc466d87efba3c28f5a/spotifyd-2018-05-26-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('1a292e8e28a2b9f2e2b7ef3ca79e664630be5194c9a33b637f0a6101ed3ba969'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('4195cf5c774502e808d27d5d752cb2230896f887782ace43dadb4cf8fe8e01ac'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-4cc466d87efba3c28f5a/spotifyd-2018-05-26-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
