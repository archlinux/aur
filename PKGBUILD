# Maintainer: FlabIt <FlabIt@flabdev.de>
pkgname=portmaster-openrc
pkgdesc='OpenRC portmaster init script'
pkgver=0.7.13.r3.413034f
pkgrel=1
arch=('any')
url='https://github.com/FlabIt/portmaster-openrc.git'
license=('MIT')
groups=()
#depends=('portmaster') <-- Uncomment when portmaster becomes available on AUR
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/FlabIt/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz")
sha256sums=('7bec4ca23e4ee43edbd06bc3f8dacc50b53064c1048677ae913f46bf0bee4afe')

package() {
    install -m 755 -D "${srcdir}/portmaster.initd" "${pkgdir}/etc/init.d/portmaster"
}
