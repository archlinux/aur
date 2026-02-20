# Maintainer: Michael Schlapa <michael@schlapa.eu>
# Contributor: Michael Schlapa <michael@schlapa.eu>

pkgname=nextcloud-app-cookbook
pkgver=0.11.6
pkgrel=1
pkgdesc="Cookbook for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/cookbook"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-cookbook-${pkgver}.tar.gz::https://github.com/christianlupus-nextcloud/cookbook-releases/releases/download/v${pkgver}/Cookbook-${pkgver}.tar.gz")
sha512sums=('d83b2746835727046281167b53e28a1a3ff989adcc22e8158e50763ac671b99d61a09ca6e5e27754f25cc4a2aad7b974f65c71abbf49e3adb728563935cea0b4')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/cookbook" "${pkgdir}/usr/share/webapps/nextcloud/apps/cookbook"
}
