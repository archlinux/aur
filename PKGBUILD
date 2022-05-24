pkgname=nextcloud-app-richdocumentscode
pkgver=21.11.402
pkgrel=1
pkgdesc="Built-in CODE Server app"
arch=('any')
url="https://github.com/CollaboraOnline/richdocumentscode"
license=('Apache')
depends=('nextcloud-app-richdocuments' 'fontconfig' 'fuse2' 'glibc')
makedepends=()
options=('!strip')
source=("richdocumentscode-${pkgver}.tar.gz::https://github.com/CollaboraOnline/richdocumentscode/releases/download/$pkgver/richdocumentscode.tar.gz")
sha512sums=('046fb329bb3af18fc29c18948a1ed2c46132e160eccb96fd21e9e24f2d125e796ce9acf31f8abe687e76dc676942fcfe8fbf5fc4ff2a2e021272ca1a936b6a5a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocumentscode" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocumentscode"
}
