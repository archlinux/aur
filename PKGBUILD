# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sven Klomp <mail at klomp dot eu>

pkgdesc='Markdown Editor extends the Nextcloud text editor with a live preview for markdown files.'
pkgname=('nextcloud-app-files-markdown')
pkgver=2.3.1
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/icewind1991/files_markdown"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_markdown-${pkgver}.tar.gz::https://github.com/icewind1991/files_markdown/releases/download/v${pkgver}/files_markdown.tar.gz")
sha256sums=('a75ac5f1f978410ff759b269d0ac9e39f1d4cbf26eda7408c7385895447added')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_markdown" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_markdown"
}
