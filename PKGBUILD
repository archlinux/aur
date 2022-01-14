# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=rustdesk-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc='OpenRC rustdesk init script'
arch=('any')
license=('GPL')
depends=('rustdesk' 'openrc')
source=('rustdesk.initd')
sha256sums=('bdbac168499f14d10b3fa74922b89707f145eb693419104a54bd5af7ee314d8c')

package() {
    install -Dm755 'rustdesk.initd' "${pkgdir}/etc/init.d/rustdesk"
}
