# Maintainer: Agampreet Singh
pkgname=ms-office-electron
pkgver=0.2.1
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron#readme"
license=('MIT')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/agam778/MS-Office-Electron/releases/download/v0.2.1/ms-office-electron-0.2.1-1-x86_64.pkg.tar.zst")
sha512sums_x86_64=('079940d31b74323d9940b8b9c265e83df209b89b7fd6a1418300269835a6472dba67a62730e151e6c90708236e9bd8b5fb08ffc38b69aa2da7045edadce2503a')

package(){

	# Extract package data
	tar xf data.tar.bz2 -C "${pkgdir}"

	install -D -m644 "/opt/MS Office - Electron/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
