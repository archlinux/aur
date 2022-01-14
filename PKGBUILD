# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=todesk-openrc
pkgver=1.0.0
pkgrel=2
pkgdesc='OpenRC todesk init script'
arch=('any')
license=('GPL')
depends=('todesk' 'openrc')
source=('todesk.initd')
sha256sums=('e5db0e72d2b5161139b9e37752c30886baf23e0cf5fd566d55adbb171cafca6e')

package() {
    install -Dm755 'todesk.initd' "${pkgdir}/etc/init.d/todesk"
}
