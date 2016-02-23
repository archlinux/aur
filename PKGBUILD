# Maintainer: Melvin Vermeeren <mail@mel.vin>
pkgname=owncloud-app-user_otp
pkgver=2.5.1
pkgrel=1
pkgdesc="One Time Password Backend app for ownCloud"
arch=('any')
url="https://github.com/loki36/user-otp"
license=('AGPL3')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/loki36/user-otp/archive/v2.5.1.tar.gz")
sha256sums=('d2487f0933b8baec87d7d0a5489fa23e4526f122fc19f9a3557423089363fc56')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/user-otp-${pkgver}/user_otp" "${pkgdir}/usr/share/webapps/owncloud/apps/user_otp"
}
