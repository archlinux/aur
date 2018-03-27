# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from https://aur.archlinux.org/packages/nextcloud-app-ocsms/
# Original contributors:
# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=nextcloud-app-ocsms
pkgver=1.21.2
pkgrel=1
pkgdesc="Push your Android SMS to your ownCloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://ftp.unix-experience.fr/owncloud-sms/$pkgver.tar.gz")
sha512sums=('b30f4128b614892fdc227dc4d793fc3dd7c1d94fac2719fa46f37a72c169b02727c9fe27f85d85ff44a92d74bf7096b6f63f75312bd234af7f60889a4da40781')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/ocsms" "${pkgdir}/usr/share/webapps/nextcloud/apps/ocsms"
}
