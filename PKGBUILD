# Maintainer: Utsob Roy uroybd@gmail.com
# Contributor: Utsob Roy uroybd@gmail.com
pkgname=franz-bin
pkgver=5.0.0_beta.17
pkgrel=1
pkgdesc="Messaging app for WhatsApp, Slack, Telegram, HipChat, Hangouts and many many more. Binrary from debian package without compiling."
arch=('x86_64')
url="https://meetfranz.com"
license=('Apache')
groups=('')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/meetfranz/franz/releases/download/v${pkgver//_/-}/franz_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('428be33a137ba03ebbed0c7df6458c66503cc5106b43c717fc26963eb0476d0b9af1933b7833f0e6e1d32b68e5ed8b91419f04f5b4101c782bc4b83b76effef2')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Franz/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
