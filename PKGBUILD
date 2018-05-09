# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-talk
_appname=spreed
pkgver=3.2.0
pkgrel=1
pkgdesc="Video & audio-conferencing using WebRTC"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/${_appname}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_appname
}

sha256sums=('a9adf372f95531d1346809ac98e3c8b780e6cc7020fd82ac0f90a24d3d366fbb')
