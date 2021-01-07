pkgname=nextcloud-app-talk_matterbridge
pkgver=1.21.0
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('175dc7ef38f081a79efc118c67651542c123ad4f729482f8af3687a4ad16b1bc7fa2ea2d9008e951c316521f641ba0db693508ed116e46a56813a065496542d7')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
