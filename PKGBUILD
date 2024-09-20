# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice
pkgver=9.3.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases/download/v$pkgver/onlyoffice.tar.gz")
sha512sums=('bfe524d81dc06b1f768172df81fefba3bbd428003c5f8fa9168fccd4eea5d3fd08d753ec736e33ffe8b7136d63a1087d7b83d2ab13932af35fcf10136d6a5f5a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
