# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-audioplayer
pkgver=2.4.1
pkgrel=1
pkgdesc="Audio Player for Nextcloud and ownCloud"
arch=('any')
url="https://rello.github.io/audioplayer"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-audioplayer-${pkgver}.tar.gz::https://github.com/Rello/audioplayer/archive/${pkgver}.tar.gz")
sha512sums=("49438a97d1e24e4934fb643b2eaf18d2f86876807d6d5b02ab82ce10c84205b18d7cb3ffac2a5b82c784f65b00c07663a66af9bd93f584d00c51fa95eedebed9")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/audioplayer-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/audioplayer"
}
