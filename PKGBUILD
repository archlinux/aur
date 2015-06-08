# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-antivirus
pkgver=0.4.2
pkgrel=1
pkgdesc="Verify files for virus using ClamAV in owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=157439"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
#source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube_v$pkgver.zip")
source=("$pkgname-$pkgver.tar.gz::https://apps.owncloud.com/CONTENT/content-files/157439-files_antivirus.tar.gz")
md5sums=('9ff09d95a9838fdabb2fcbb7c7ba41a5')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/files_antivirus ${pkgdir}/usr/share/webapps/owncloud/apps/files_antivirus
}
