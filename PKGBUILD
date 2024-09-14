pkgname=infinitywallet
pkgver=2.11.0
pkgrel=15
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v2.11.0/InfinityWallet_2.11.0.deb")
sha512sums_x86_64=('b76a70b9ea5ccd8ce422728c6626151e240f93b2c237068e8cc821703c9f5b4db4a51b84a3931aa4e2274c9c01c4c6a76aeb0a4fb97348b6de5cc09026f1d1a4')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
