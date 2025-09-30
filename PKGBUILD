# Maintainer: Juan C. Müller <me at juancmuller dot com>
# Co-Maintainer: Leonardo Mora Castro <leomc145 at gmail dot com>

pkgname=duo-desktop
pkgver=4.3.0
pkgrel=5
pkgdesc="Duo Desktop gives Duo customers more control over which computers can access corporate applications based on the trust (with Trusted Endpoints) and security posture of the device (with Device Health)."
arch=('x86_64')
license=('custom')
url="https://duo.com/docs/duo-desktop"
depends=('ca-certificates' 'openssl' 'zlib')
replaces=('duo-device-health')
options=(!strip)
source=("https://desktop.pkg.duosecurity.com/${pkgname}-latest.${arch}.rpm")
sha256sums=('43587deced01ffdaa5f163289adc1095936e34d9901f6a1cb478e2ebb7555942')
install=duo.install

package() {
    cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
