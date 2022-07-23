pkgname=infinitywallet
pkgver=1.10.4beta
pkgrel=14
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.10.4-beta/InfinityWallet_1.10.4-beta.deb")
sha512sums_x86_64=('4130574873f5570ced3d25d8124a1cf26f30e8bb77c8e35a70e99840aa645a4a921a5f60ba9dcf46566c507c22f8cb577e11b2764fefec2c644edce1091cc4f2')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
