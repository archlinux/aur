# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=1.1.0
pkgrel=1
pkgdesc="Two factor TOTP provider for ownCloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_totp/"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${url}/releases/download/${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('79625ccb3546a721a287be087dc6b041587713fd3a0aa53dd11ec96903380c37')
