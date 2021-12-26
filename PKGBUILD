# Maintainer: FlabIt <FlabIt@flabdev.de>
pkgname=portmaster-openrc
pkgdesc='OpenRC portmaster init script'
pkgver=0.7.12.r2.dd6614b
pkgrel=1
arch=('any')
url='https://github.com/FlabIt/portmaster-openrc.git'
license=('MIT')
groups=()
#depends=('portmaster') <-- Uncomment when portmaster becomes available on AUR
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/FlabIt/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz")
sha256sums=('8c2efbdb6e2cc21bf78a0e7ace0d64ca03419ab747cc96054cbffac4d170c5ed')

package() {
    install -m 755 -D "${srcdir}/portmaster.initd" "${pkgdir}/etc/init.d/portmaster"
}
