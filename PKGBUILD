pkgname=infinitywallet
pkgver=1.0.76beta
pkgrel=8
pkgdesc="Digital asset wallet"
arch=('x86_64')
url="https://infinitywallet.io"
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/InfinityWallet/Releases/releases/download/v1.0.76-beta/InfinityWallet_1.0.76-beta_amd64.deb")
sha512sums_x86_64=('f559c0398b9dcb92de091729fac96d392bf64996c0e2e340f32432d92444243a0030043b3bf714b776ea5e7f71ca11df7d0c28d006aec18f8bb4aa1bb052c449')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
