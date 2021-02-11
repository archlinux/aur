pkgname=nextcloud-app-talk_matterbridge
pkgver=1.22.0
pkgrel=1
pkgdesc="Nextcloud Talk interface to matterbridge"
arch=('any')
url="https://github.com/nextcloud/talk_matterbridge"
license=('AGPL')
depends=('nextcloud-app-spreed')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/talk_matterbridge/releases/download/v$pkgver/talk_matterbridge.tar.gz")
sha512sums=('4084ae8d5d1e13cf0f95b1c2369f1232a6de87c8cc39b218d7d80fceebbaa92acabaa63f84db2b6100b8b45dc3a571540345af2cf8aa00126b24ac661cd2f929')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/talk_matterbridge
}
