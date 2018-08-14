# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nextcloud-app-markdown
_releasename=files_markdown
pkgver=2.0.4
pkgrel=1
pkgdesc="Extends the Nextcloud text editor with a live preview for markdown files"
arch=('any')
url="https://github.com/icewind1991/files_markdown"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp --no-preserve=owner -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('78958cd743e101251dea70a262646250ea78318c2546f088f8ea89b586507565')
