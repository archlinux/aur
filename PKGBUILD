# Maintainer: FlabIt <FlabIt@flabdev.de>
pkgname=portmaster-openrc
pkgdesc='OpenRC portmaster init script'
pkgver=0.7.10.r1.312a55f
pkgrel=1
arch=('any')
url='https://github.com/FlabIt/portmaster-openrc.git'
license=('MIT')
groups=()
#depends=('portmaster') <-- Uncomment when portmaster becomes available on AUR
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/FlabIt/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz")
sha256sums=('f5889bcaa094d70945a2f393fd27086e138fa19d63a19407f1d0897d9a92e443')

package() {
    install -m 755 -D "${srcdir}/portmaster.initd" "${pkgdir}/etc/init.d/portmaster"
}
