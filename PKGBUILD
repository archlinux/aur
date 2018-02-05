# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=1.3.1
pkgrel=1
pkgdesc="Two factor TOTP provider for ownCloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_totp/"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('145c450cbd509ffd29d7969f6d0a361dc857cc7dd6ead5d593a5902d5a60b204')
