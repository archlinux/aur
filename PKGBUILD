# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.3.1
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://releases.passman.cc/passman_${pkgver}.tar.gz")
sha512sums=("9c2572f8a4245c8b985cfa78b77cf27a5df4d9c6e183a0652e9e6d5732dfa46a647839cc4b965053515735d6b006a99b1ea0df21e59c1049b66837227b017db6")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
