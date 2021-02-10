# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='The original text editor app for Nextcloud, based on Ace'
pkgname=('nextcloud-app-files-texteditor')
_appname='files_texteditor'
pkgver=2.13.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/nextcloud/files_texteditor"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_texteditor-v${pkgver}.tar.gz::https://github.com/nextcloud/files_texteditor/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('9d2037e4b972beb3cf6fc10de21d582f98ccca128fd0e560f45810fb64de125a3fcf5489dad0340f60ab878470f3e7bd11a5bfd918d25a240d44640386a2c18a')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
