# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=owncloud-app-totp
_releasename=twofactor_totp
pkgver=0.4.1
pkgrel=1
pkgdesc="Two factor TOTP provider for ownCloud"
arch=('any')
url="https://github.com/ChristophWurst/twofactor_totp"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("${url}/releases/download/${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/owncloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/owncloud/apps/ $srcdir/$_releasename
}

sha256sums=('591b2adc90dcb9aedd05b3da5540c98c3fdbb44cb8d871a1298593d93010c48c')
