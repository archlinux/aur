# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
pkgdir="/opt/MS Office - Electron/"
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron#readme"
license=('MIT')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=$pkgname.install
source_x86_64=("https://github.com/agam778/MS-Office-Electron/releases/download/v0.3.0/MS-Office-Electron-Setup-0.3.0-x86_64.deb")
sha512sums_x86_64=('ac7f947f88b0fc575539009881f0ba2a93fdc176611626eb019fec1b83158960b6a341c3d47e4fda8f5d6b405627a2a3108d702c012823e9a8c35ebd3b1da182')

package(){

    echo "  -> Extracting the data.tar.bz2..."
	# Extract package data
	bsdtar xf data.tar.bz2 -C "$pkgdir/"

	install -D -m644 "/opt/MS Office - Electron/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
