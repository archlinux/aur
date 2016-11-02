# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.4
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://apps.nextcloud.com/apps/richdocuments"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("collaboraonline-${pkgver}.tar.gz::https://github.com/LukasReschke/testrepo/releases/download/1/richdocuments.tar.gz")
sha512sums=("58fd4888fdfc8bef6c5561c966e1bc3f3375fe8dd50f51763bace2db8c489c502a71f3c7494d0f7b4b58ca8ef74a00f553204ef849ca4b3f413efedbb0117685")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/collaboraonline"
  cp -r "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/collaboraonline"
}
