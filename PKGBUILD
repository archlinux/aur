# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice
pkgver=9.8.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases/download/v$pkgver/onlyoffice.tar.gz")
sha512sums=('b9ff13aec119abbb2f30daa6573276e9d96b9521a25837bbcfc919ddfb146aba33e0f7ffd79dbd08f46183271218bc934f62d1b2aed59e09d2b6e0b5c4f175df')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
