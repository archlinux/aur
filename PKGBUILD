# $Id: PKGBUILD 261215 2017-10-02 07:50:44Z spupykin $
# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-richdocuments
pkgver=3.6.0
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'libreoffice-online')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/v$pkgver/richdocuments.tar.gz")
sha512sums=('341fc186ea7fc7994dbe6291f23dfd573f40060569be57ae254c21641aa8f92ded5a60de8d6b85a655fd248904902e40251da73f034d33c07f795950f79c800a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
