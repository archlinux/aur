pkgname=nextcloud-app-talk_matterbridge
pkgver=1.28.0_0
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
sha512sums=('4e7138be404778c63c6c0ce9e51950fd7586ccdb50b9d47c3ecd907707b51e0ce0dcb4ccfd13ac4234309e085857b54bb55f022aa93a4264ce80dc5ab06c4f7e')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
