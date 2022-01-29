pkgname=infinitywallet
pkgver=1.4.0beta
pkgrel=11
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.4.0-beta/InfinityWallet_1.4.0-beta.deb")
sha512sums_x86_64=('38918cb8ab6124f28725c7dfed0024098de1ec092d3d0f9fdc3e28adf7efce8dccffe796e2f1bce16820046ece84f3e3f800573f5f4da10987a14d0ecd63994d')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
