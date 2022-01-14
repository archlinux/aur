# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=todesk-openrc
pkgver=1.0.1
pkgrel=1
pkgdesc='OpenRC todesk init script'
arch=('any')
license=('GPL')
depends=('todesk' 'openrc')
source=('todesk.initd')
sha256sums=('c32ec999aea63304cb19295bf5ca8171d19cddf3afaef205c6210c4555b22283')

package() {
    install -Dm755 'todesk.initd' "${pkgdir}/etc/init.d/todesk"
}
