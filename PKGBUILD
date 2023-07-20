# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sven Klomp <mail at klomp dot eu>

pkgdesc='Markdown Editor extends the Nextcloud text editor with a live preview for markdown files.'
pkgname=('nextcloud-app-files-markdown')
pkgver=2.4.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/icewind1991/files_markdown"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_markdown-${pkgver}.tar.gz::https://github.com/icewind1991/files_markdown/releases/download/v${pkgver}/files_markdown-v${pkgver}.tar.gz")
sha256sums=('e121093ed9fa08eea03ee5591082476a6068a7111b02ead63a70b631c9d44fc6')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_markdown" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_markdown"
}
