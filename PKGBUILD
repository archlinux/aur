# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-ocsms
pkgver=1.7.0
pkgrel=1
pkgdesc="Push your Android SMS to your ownCloud instance."
arch=('any')
url="https://github.com/nerzhul/ocsms"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nerzhul/ocsms/archive/v1.7.0.tar.gz")
sha512sums=('3e157568496e1f82e9425181030eec6c916da6179f6b4f84b279ff778aba160e783b09f709f086f15f6e9911a6e073f1ae3965925ad0b595bb633616619e4753')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/ocsms-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/ocsms"
}
