# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=1.3.0
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

sha256sums=('b1977d9d014a7d228651a3409c616ac72a857eb2dff62c5fe43239e61b1379eb')
