# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sven Klomp <mail at klomp dot eu>

pkgdesc='Markdown Editor extends the Nextcloud text editor with a live preview for markdown files.'
pkgname=('nextcloud-app-files-markdown')
pkgver=2.3.4
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/icewind1991/files_markdown"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_markdown-${pkgver}.tar.gz::https://github.com/icewind1991/files_markdown/releases/download/v${pkgver}/files_markdown.tar.gz")
sha256sums=('4e5217486ed72db5e1d906a7101082ca486dca1a8acbcbc6aa297acf30c59025')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_markdown" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_markdown"
}
