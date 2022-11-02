pkgname=nextcloud-app-richdocumentscode
pkgver=22.5.702
pkgrel=1
pkgdesc="Built-in CODE Server app"
arch=('any')
url="https://github.com/CollaboraOnline/richdocumentscode"
license=('Apache')
depends=('nextcloud>=19' 'nextcloud<26' 'nextcloud-app-richdocuments' 'fontconfig' 'fuse2' 'glibc')
makedepends=()
options=('!strip')
source=("richdocumentscode-${pkgver}.tar.gz::https://github.com/CollaboraOnline/richdocumentscode/releases/download/$pkgver/richdocumentscode.tar.gz")
sha512sums=('a1e6a3c1826aa741bd851d31e949812d4bf80ec29c37b8a7b43b680e3571e7bc8bffecfbc800bcdea371950318af743f6b99042a92f16dc67e986fd36681aa21')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocumentscode" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocumentscode"
}
