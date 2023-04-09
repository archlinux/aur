pkgname=nextcloud-app-talk_matterbridge
pkgver=1.26.0
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('610e90af5069f005a5962f47c9d5ecd1222434d67f00c2f289949f7e917ced0804d1db27d7c24839e335207cbdf5a5a80fe5a877f8ee63bc2f500e7dde2de405')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
