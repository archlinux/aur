pkgname=nextcloud-app-talk_matterbridge
pkgver=1.29.0_0
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v${pkgver/_/-}/talk_matterbridge.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/talk_matterbridge/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('847a203c7f01b6cb88a88c38121aeffe3cea6fa3d970d7f7b9a333adcfc4c121e618e21ebae4c7d78ab040a78d14d11660b2edcb21dff80f1b5e3ffd41c4dfbc')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
