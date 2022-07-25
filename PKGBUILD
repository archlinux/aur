pkgname=nextcloud-app-talk_matterbridge
pkgver=1.25.2
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
sha512sums=('a31443d1fdf93597750ba2910793d492d165213a5780b496632a222893c195bfe0cd596c4e2ffcf78d58eb301ebbd9cd98055b6dc182eb2e5018af074f2ed283')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
