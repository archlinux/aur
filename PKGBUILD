# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.25
pkgrel=3
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'libreoffice-online')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/1.1.25/richdocuments.tar.gz")
sha512sums=("4d55f366ed9c39dcc04a5685c86e8099af472ff305bfba7bee0aaf2e80b571c3343638eec2051857911f63f3428b39509665b73b3b2f527b7380dc25a6795c29")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}

# Todo:
# - ArchWiki tutorial
