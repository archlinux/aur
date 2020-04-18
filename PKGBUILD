# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=5.1.0
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=17.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('21b74cad4424720772fcd607fa61255da172a0cd78ce974b027118da17d986f2')
