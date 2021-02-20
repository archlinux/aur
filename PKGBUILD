# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-talk
_appname=spreed
pkgver=10.0.5
pkgrel=1
pkgdesc="Video & audio-conferencing using WebRTC"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/${_appname}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('a736b55c9dda67ceee5d38b9b62da0c4533ac9f21e1e373e9261f4d190702a41675b098047fe6cabfcb78f624c89e1fd1bcaefa6b487f78ca054440cb9ff7bd8')

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_appname
}

