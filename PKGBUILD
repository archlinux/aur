# Maintainer: FlabIt <FlabIt@flabdev.de>
pkgname=portmaster-openrc
pkgdesc='OpenRC portmaster init script'
pkgver=0.7.18.r5.6c9a64e
pkgrel=1
arch=('any')
url='https://github.com/FlabIt/portmaster-openrc.git'
license=('MIT')
groups=()
#depends=('portmaster') <-- Uncomment when portmaster becomes available on AUR
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/FlabIt/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz")
sha256sums=('71a1c853e8812877888c2046f286646275a278b3679f59801f731312e4ea20a9')

package() {
    install -m 755 -D "${srcdir}/portmaster.initd" "${pkgdir}/etc/init.d/portmaster"
}
