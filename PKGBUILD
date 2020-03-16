# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-talk
_appname=spreed
pkgver=8.0.5
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

sha512sums=('4541ff6338523097ed06f3889c2a5c0e07d95b90bd4edc9f2f23d9da104f4657f0288de57ee5cd53f8221ba3fc38f973d5dec0aaf37405d3198306391fccfee9')
