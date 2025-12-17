# Maintainer: Michael Schlapa <michael@schlapa.eu>
# Contributor: Michael Schlapa <michael@schlapa.eu>

pkgname=nextcloud-app-cookbook
pkgver=0.11.5
pkgrel=1
pkgdesc="Cookbook for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/cookbook"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-cookbook-${pkgver}.tar.gz::https://github.com/christianlupus-nextcloud/cookbook-releases/releases/download/v${pkgver}/Cookbook-${pkgver}.tar.gz")
sha512sums=('bf41dc9adc7e40644e621aeb503ab65e7ef413858fc727845380a666011efec2d7df87f8b610b1ea786a3f2c9ce850b6125c4e88e3b1007f70ec61b0f89e19cd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/cookbook" "${pkgdir}/usr/share/webapps/nextcloud/apps/cookbook"
}
