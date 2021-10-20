pkgname=infinitywallet
pkgver=1.0.82beta
pkgrel=9
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/1.0.82-beta/InfinityWallet_1.0.82-beta.deb")
sha512sums_x86_64=('15a82ecc76f1265736033ae021bdebc66327ab235a00a4cb57926ce461caa75baa42690f1d83ab1dd5fe942a92e86a12d6e8844a0c27279494f6b66a7320aadd')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
