pkgname=nextcloud-app-talk_matterbridge
pkgver=1.18.3
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('8fb0ee3413a9d90bde3cc3def16b64cde7a8f1867e194338fb3a8295bd8f640afeed1cd71fd5d838b139bb8cf21a31a6be3c1056f1e7925bf4092cbd7566160f')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
