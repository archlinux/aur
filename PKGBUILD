pkgname=nextcloud-app-richdocumentscode
pkgver=22.5.502
pkgrel=1
pkgdesc="Built-in CODE Server app"
arch=('any')
url="https://github.com/CollaboraOnline/richdocumentscode"
license=('Apache')
depends=('nextcloud-app-richdocuments' 'fontconfig' 'fuse2' 'glibc')
makedepends=()
options=('!strip')
source=("richdocumentscode-${pkgver}.tar.gz::https://github.com/CollaboraOnline/richdocumentscode/releases/download/$pkgver/richdocumentscode.tar.gz")
sha512sums=('4cfb9c2b89ddd377d9281bbe448267fac665945463d32164189ebf874b36c4d0a4fe11422b3fd9bef25c06627796369dfb678f80cb133e9b0e565b2b3cf04c37')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocumentscode" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocumentscode"
}
