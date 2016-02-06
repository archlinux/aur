# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-antivirus
pkgver=0.8.0.1
pkgrel=1
pkgdesc="Verify files for virus using ClamAV in owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=157439"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/files_antivirus/releases/download/v$pkgver/files_antivirus.tar.gz")
md5sums=('33f2d9c16982dd7a8505fa37e02587f7')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/files_antivirus ${pkgdir}/usr/share/webapps/owncloud/apps/files_antivirus
}
