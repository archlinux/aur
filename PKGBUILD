# Maintainer: Noctivivans <noctivivans@gmail.com>
# Forked from https://aur.archlinux.org/packages/nextcloud-app-ocsms/
# Original contributors:
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Polichronucci <nick at discloud dot eu>
# Contributor: oguzkagan <me at oguzkaganeren dot com dot tr>

pkgname=nextcloud-app-ocsms
pkgver=2.1.8
pkgrel=2
epoch=1
pkgdesc="Push your Android SMS to your Nextcloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/ocsms/releases/download/$pkgver/ocsms-$pkgver.tar.gz")
sha512sums=('99ffa20f90947045a7ad6d25dbc84e792b2afab0a230df5f45582501b698428a65c5a02665e54ae4b09fbded84f5361363193bdfbca8a963ab61ab5df9400a8e')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/ocsms" "${pkgdir}/usr/share/webapps/nextcloud/apps/ocsms"
}
