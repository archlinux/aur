pkgname=infinitywallet
pkgver=1.9.1beta
pkgrel=12
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.9.1-beta/InfinityWallet_1.9.1-beta.deb")
sha512sums_x86_64=('8c662410350608eab8a9c58105e2e6263edb0f58afa86549959c48dbb860cb643be4dd41f324f28ca4d24c44b018e14abb41d26cd152ea1ff6921d740ee77b70')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
