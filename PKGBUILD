# Maintainer: arjan5 <aur@anymore.nl>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=1.5.1
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/${pkgver}/${_releasename}.tar.gz")
sha256sums=('0d0852dff958e1775d75966e5c5ea6e785d342d251a052f2ee78f73c0719eacd')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

