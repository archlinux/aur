pkgname=nextcloud-app-talk_matterbridge
pkgver=1.31.1026000
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge-$pkgver.tar.gz")
sha512sums=('28704d6b963f162c9d6e683c9a79cf1c89dab0f2f2f5f10709aff013da0c3bfab0aab5b553d94487bb18f33bc9a8e68b26b96ac08c2e09be3f3bad35eed31633')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
