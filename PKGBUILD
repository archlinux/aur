# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reqview
pkgver=2.8.2
pkgrel=1
pkgdesc="Requirements Management Tool For Software and Systems Development Where Requirements Matter"
arch=('x86_64')
url='https://www.reqview.com'
license=("custom:${pkgname}")
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://s3.eu-central-1.amazonaws.com/reqview-desktop-linux/ReqView-${pkgver}-linux-amd64.deb"
        'LICENSE')
sha256sums=('0cfba52c27b31e1350dea9c33c0e26bfc6df98efa30f9d3d899e717af608219d'
            'SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}