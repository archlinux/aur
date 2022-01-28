pkgname=nextcloud-app-talk_matterbridge
pkgver=1.23.2
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('c08ff4fec1bdc296f24884251565dae4199837767a57c12bb385fb9eda8200450e01805c17e3788b096b0bf5729029786dc4b6a58b9e7b887c9bc46e9d65faea')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
