# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-antivirus
pkgver=0.7.0.1
pkgrel=1
pkgdesc="Verify files for virus using ClamAV in owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=157439"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
#source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube_v$pkgver.zip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/files_antivirus/releases/download/v0.7.0.1/files_antivirus.tar.gz")
md5sums=('85f78ec60318433f732aaadae6cf62b4')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/files_antivirus ${pkgdir}/usr/share/webapps/owncloud/apps/files_antivirus
}
