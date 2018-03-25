# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-talk
_appname=spreed
pkgver=3.1.0
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

sha256sums=('8225e448af89d4145edbbb009d37a6e8dad81db19b132916d714ae487765fdd8')
