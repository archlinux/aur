pkgname=nextcloud-app-talk_matterbridge
pkgver=1.22.1
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('c84b4788240a62e9bf9e78ebbedf553b406f21b92bdefc5e19dec474f2c670e798e8244e61fbf5afe58194cd3189b08cf840b4f0453663650b8d380e768f824c')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
