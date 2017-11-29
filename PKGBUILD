# $Id: PKGBUILD 261215 2017-10-02 07:50:44Z spupykin $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-richdocuments
pkgver=1.12.35
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'libreoffice-online')
makedepends=()
options=('!strip')
#source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/$pkgver/richdocuments.tar.gz")
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/files/1054122/richdocuments.tar.gz")
sha512sums=('3f5029e1bcb342cd2603fb6058cede33bff8c59c4eeeb6fbd31ed84cfca620ed08037c9459c58f6475fde9370637f6e90e5008bdc535813d31c5079e2b66f0c3')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
