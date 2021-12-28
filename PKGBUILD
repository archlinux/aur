pkgname=infinitywallet
pkgver=1.2.1beta
pkgrel=10
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.2.1-beta/InfinityWallet_1.2.1-beta.debd")
sha512sums_x86_64=('f36da80cdc3d35bf6d83e573240f92ea115ab03fe7ec3b5acd699bce999df6d5e81a8ab1966ad8977773bbba2710e3fb6fba0229c3195262cd698e938fd864de')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
