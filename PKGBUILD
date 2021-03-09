# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sven Klomp <mail at klomp dot eu>

pkgdesc='Markdown Editor extends the Nextcloud text editor with a live preview for markdown files.'
pkgname=('nextcloud-app-files-markdown')
pkgver=2.3.3
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/icewind1991/files_markdown"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_markdown-${pkgver}.tar.gz::https://github.com/icewind1991/files_markdown/releases/download/v${pkgver}/files_markdown.tar.gz")
sha256sums=('9b30975a3ec19bac707ab56949f2f69efa2ce61eed2b1a8607d3d78e4f296402')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_markdown" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_markdown"
}
