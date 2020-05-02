# Maintainer: Jesse Luehrs <doy@tozt.net>
pkgname=rbw
pkgver=0.1.0
pkgrel=1
depends=('pinentry')
conflicts=('rbw-git')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/releases/deb/${pkgname}_${pkgver}_amd64.deb)
sha256sums=('8767bcf7971cea70545763e6d4ee632db0f7112df830bfea10abc3eb226a3bf4')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

package() {
    tar xf data.tar.xz -C "${pkgdir}"
}
