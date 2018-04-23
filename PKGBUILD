pkgname=spotifyd-bin
pkgver=20180403
pkgrel=1
depends=('alsa-lib')
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-61816928a53a74993dc0/spotifyd-2018-04-03-amd64.zip" "spotifyd.service")
sha256sums_armv7h=('401e8b1c0bdd4abc376bf311771b03fd583049fa62711e3be7ba611e5f21b025'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
sha256sums_x86_64=('aa410c7c60bff7f1ebe19005e3f72bedc54394e9336656b989d38d432646fb55'
                   '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-61816928a53a74993dc0/spotifyd-2018-04-03-armv6.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
