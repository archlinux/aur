# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=t230c2-firmware
pkgver=1
pkgrel=1
pkgdesc="Geniatech T230C2 firmware files"
arch=('any')
url="https://github.com/osmc/dvb-firmware-osmc"
license=('custom')
source=("https://github.com/osmc/dvb-firmware-osmc/raw/master/dvb-demod-si2168-d60-01.fw"
        "https://github.com/osmc/dvb-firmware-osmc/raw/master/dvb-tuner-si2141-a10-01.fw")
sha256sums=('753e338163d10244837a2fa4ad1258e1f270e3040e21ffa574609814943437c9'
            '29cf0b0d20a3040f8e59b0ed548e9d3d54eda0b2d2869708f7bcee9d7cbf7e34')

package() {
    install -Dm644 "${srcdir}/dvb-demod-si2168-d60-01.fw" "${pkgdir}/usr/lib/firmware/dvb-demod-si2168-d60-01.fw"
    install -Dm644 "${srcdir}/dvb-tuner-si2141-a10-01.fw" "${pkgdir}/usr/lib/firmware/dvb-tuner-si2141-a10-01.fw"
}
