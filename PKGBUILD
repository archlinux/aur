# Maintainer: kausban <mail at kausban com>
pkgname=polar-bookshelf-bin
pkgver=1.0.2
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
sha512sums_x86_64=('b06b0ca0d3dfd169d757596095f88d5931c4d510f4ed89452cc21eb9703a1d722acc08ba517ec04a7c49f8c691f75e9ba000f57d42442d9f46208510dbd8e0dd')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Polar Bookshelf/resources/app.asar.unpacked/node_modules/term-size/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
