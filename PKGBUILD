# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-talk
_appname=spreed
pkgver=8.0.9
pkgrel=1
pkgdesc="Video & audio-conferencing using WebRTC"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/${_appname}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('85c8f6bd72a73913db5f6de60f90eb7503a5d5fe604d0997b6556154153c04b5f967a66ad3c0a8b25f86d99cbf22febb28048b04ab66685379d50a2c583024ce')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_appname
}

