# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-antivirus
pkgver=0.8.0.1
pkgrel=2
pkgdesc="Verify files for virus using ClamAV in owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=157439"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/files_antivirus/releases/download/stable9-${pkgver}/files_antivirus.tar.gz")
sha512sums=('1494ab5529701d148a4ba201ba8928b001a6a4091cc0e9369e1ad377fb5d1df24509c79435635e73e0f84f06e0862579b2c00a038247f8f06bd64ab7685c8327')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/owncloud/apps/files_antivirus"
}
