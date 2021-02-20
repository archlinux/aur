# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=6.0.0
pkgrel=1
pkgdesc="Two factor TOTP provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_totp/"
license=('AGPL')
depends=('nextcloud>=21.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('29f64c5d825ac6967d514ce0ecadc19f9b4f8f9669019db1ffa96348acbfd820')
