# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Markdown Editor extends the Nextcloud text editor with a live preview for markdown files.'
pkgname=('nextcloud-app-files-markdown')
pkgver=1.0.1
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/icewind1991/files_markdown"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("https://github.com/icewind1991/files_markdown/releases/download/v${pkgver}/files_markdown.tar.gz")
sha256sums=('73514984c947cb16bd353af0f1a13ba8d885116320b3de09e54a3271416dd09c')


package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_markdown" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}

