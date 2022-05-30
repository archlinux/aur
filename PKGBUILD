pkgname=infinitywallet
pkgver=1.9.3beta
pkgrel=13
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.9.3-beta/InfinityWallet_1.9.3-beta.deb")
sha512sums_x86_64=('be7eb35beef19b742e12a6d1f4d1995a399d5ba64005361b3e9936609d1479ee68c7e99349061dcdb8a17f843244624ecd71c468e3a01661ebd6880ddaf5bf10')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
