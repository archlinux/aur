pkgname=nextcloud-app-talk_matterbridge
pkgver=1.33.1026000
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge-$pkgver.tar.gz")
sha512sums=('6d00ed98ee092aa69ec8e29724d2c292d16404186dd8eb256aa8355993572a8fa2151930645eec9074e77d53d207ffada76dbc51975ca6f126759ef5cb448bf5')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
