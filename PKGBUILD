# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=6.1.0
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=20.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('40bd5ccd3560358b0fc8d5ad0e541bc7f7b9229abbc4c55457dc3e9bf2c7c062')
