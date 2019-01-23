# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-audioplayer
pkgver=2.5.2
pkgrel=1
pkgdesc="Audio Player for Nextcloud and ownCloud"
arch=('any')
url="https://rello.github.io/audioplayer"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-audioplayer-${pkgver}.tar.gz::https://github.com/Rello/audioplayer/archive/${pkgver}.tar.gz")
sha512sums=('162fa68bb94e38493e7f8babf0f674035bdc2cfe03305d41d88f5da5b6e96390d697ca43dd34901cd690adccdff78c86bbacf4606d68e9390573a9bb09d3a811')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/audioplayer-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/audioplayer"
}
