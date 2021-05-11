pkgname=infinitywallet
pkgver=1.0.73beta
pkgrel=7
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.0.73-beta/InfinityWallet_1.0.73-beta_amd64.deb")
sha512sums_x86_64=('449713910b789d2e3a37af53ea9bf2dc29241506a7efd1b53a35e9a51083550fb0c9ed76b1bc62ae98e3fa820a9620ac47277fe26e5d59085f48550c3526d3dd')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
