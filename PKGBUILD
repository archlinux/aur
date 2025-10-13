pkgname=nextcloud-app-talk_matterbridge
pkgver=1.32.1026000
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge-$pkgver.tar.gz")
sha512sums=('a3ded27fdd1ca9034f995248cfcd31a89c0b702726b2527f950284b532298de7935968838e38505f21eb2cdc9a7341138a4eb97095d16da0177aa0201fabc042')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
