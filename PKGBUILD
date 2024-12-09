pkgname=nextcloud-app-talk_matterbridge
pkgver=1.30.1026000
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge-$pkgver.tar.gz")
sha512sums=('032c7f14603537f170455dd2303bdd8af412500a21225c857c1cc97829ea8de9cde125f905dc4daffe6b0fef21c131ebb19e9be4345617a58196998ed4f41d9e')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
