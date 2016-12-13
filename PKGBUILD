# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.24
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/owncloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'docker')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/richdocuments/releases/download/${pkgver}/richdocuments.tar.gz")
sha512sums=("450dc9d404f492d9704a8da7d761c5c4f32268eb904de01f0bea9a8f889a848bdf5d6d4e0319e910445fea005913c83250512d3741d9d8fb5848236e21c75062")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}

# Todo:
# - ArchWiki tutorial
# - systemd unit file to start and enable docker image
