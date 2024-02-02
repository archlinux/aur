# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=23.12.3
pkgrel=2
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('89b18d1ae9674c80ef1a756a9abb2f316807c8eebd3d48c10dfcfc36c0be4519d22f510147865a7213bf569c80a53798433670fa4ce64f2d8a908154a34693fe')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
