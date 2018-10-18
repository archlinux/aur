# Maintainer: kausban <mail at kausban com>
pkgname=polar-bookshelf-bin
pkgver=1.0.3
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
sha512sums_x86_64=('955c06fed2c8dddbde7402f4bc5ffac4b4b85dcb373503c2fa85c3a2be946f5c06b8a81c29a4d377d981deb52c8419b38e653b12d14390f15f2ec2c8544c71f8')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Polar Bookshelf/resources/app.asar.unpacked/node_modules/term-size/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
