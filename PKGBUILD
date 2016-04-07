# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-antivirus
pkgver=9.0.1
pkgrel=1
pkgdesc="Verify files for virus using ClamAV in owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=157439"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/files_antivirus/archive/v9.0.1.tar.gz")
sha512sums=('a535c5d5ae3aaf6ad957d076f0d6203f12c3bebfe69f1704e8eb2702e7979d22a2ea256e48e0fe0c271e870643d2aaed678bbda150acd6af1c08a2cd213a6292')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/files_antivirus"
}
