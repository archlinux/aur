# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.3.5
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://releases.passman.cc/passman_${pkgver}.tar.gz")
sha512sums=("89e26c4022732cce562a861efde9fc780c69bda0729f7411597b12842959129347715e81bfeb70bdd6734acf3aca09f206bc7a1e84d8f59d340ab65aca490367")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
