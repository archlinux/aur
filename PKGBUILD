# Maintainer: oguzkagan <me@oguzkaganeren.com.tr>
# Forked from https://aur.archlinux.org/packages/nextcloud-app-ocsms/
# Original contributors:
# Contributor: Polichronucci <nick at discloud dot eu>

pkgname=nextcloud-app-ocsms
pkgver=2.1.3
pkgrel=1
epoch=1
pkgdesc="Push your Android SMS to your Nextcloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/ocsms/releases/download/$pkgver/ocsms-$pkgver.tar.gz")
sha512sums=('486b9b2d18a6f142e58e3e588102dc33b91c9afc352338a087eeadd6917419061c4ddbc1fded0eb141a23d0eac202e62ee275159d1683b42983dc75f54fbc5a0')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/ocsms" "${pkgdir}/usr/share/webapps/nextcloud/apps/ocsms"
}
