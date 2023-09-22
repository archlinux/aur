pkgname=nextcloud-app-talk_matterbridge
pkgver=1.27.0
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
sha512sums=('62b432fd4e801d46dec863ef0da8c2737dc17b5786c93b077517b689f7666374c54c0460a517eeedea0ef787c70d1274a9fff3fda86fa3db2632f0f581500cc4')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
