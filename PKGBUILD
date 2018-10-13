# Maintainer: kausban <mail at kausban com>
pkgname=polar-bookshelf-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Polar Bookshelf"
arch=('x86_64')
url="https://github.com/burtonator/polar-bookshelf"
license=('GPL2')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/burtonator/polar-bookshelf/releases/download/v"$pkgver"/polar-bookshelf-"$pkgver"-amd64.deb")
sha512sums_x86_64=('67ae55e02a0c08d59d0982f406f2932060d286606887a6ada9a13e9bbf543f569b1393c24d82d73675c7a5b245ff8f453c01a028180a6efb1d53221e39fae542')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Polar Bookshelf/resources/app.asar.unpacked/node_modules/term-size/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
