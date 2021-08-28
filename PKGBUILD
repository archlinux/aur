pkgname=nextcloud-app-talk_matterbridge
pkgver=1.22.4
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('d4ad7171981c8f41fced49223868429eccfa0ca2259ae21b8e8cf48a87b0cdca84bdfa8bdd5512497b8d03671daa47b51c45612cfd19b9617dfa88910571afd6')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
