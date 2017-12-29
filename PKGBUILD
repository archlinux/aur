# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

pkgname=nextcloud-app-markdown
_releasename=files_markdown
pkgver=2.0.1
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

sha256sums=('c95dbcd2a470262973c7f19b3445a82717acaa7702579f57167842596b04e7a4')
