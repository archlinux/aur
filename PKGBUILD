# Maintainer: arjan5 <aur@anymore.nl>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=1.4
pkgrel=1
pkgdesc="Two factor U2F provider for ownCloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('6a6cef7e1f5fc0c432b714f8285af6ab7295039921f51c5ae892e3cbfdd1af75')
