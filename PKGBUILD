# $Id: PKGBUILD 261215 2017-10-02 07:50:44Z spupykin $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-richdocuments
pkgver=2.0.13
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'libreoffice-online')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/$pkgver/richdocuments.tar.gz")
sha512sums=('29d113f836d813937e9ad0bd9093b745b8c9d58a907f99890e94781a8c601ce5527b8fe24a9029a67f2e69d5a935b04b58e655f010a267ea4abbdd1cb6617142')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
