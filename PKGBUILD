# Maintainer: ndom91
# Contributor: Drata
pkgname=drata-agent
pkgver=3.1.0
pkgrel=1
pkgdesc="The Drata Agent is a light-weight tray-application that runs in the background, reporting important read-only data to Drata about your machine’s state for compliance tracking."
pkgdir="/opt/Drata Agent"
arch=('x86_64')
url="https://github.com/drata/the-agent"
license=('unknown')
groups=('')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
makedepends=('binutils')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
validpgpkeys=('2DCE07BE62610800B1E4BEDE955D29B1F039BC43')
source_x86_64=("https://cdn.drata.com/agent/dist/linux/drata-agent-3.1.0.deb")
sha512sums_x86_64=('8f09e9480b0d7531b6e2dfaa72ba086ca0f6f177daa93fa3aec79ecec3e33bab33ca8dca51df6d935928b1488a4af6b1f393111b59294860a4c1e786b6615712')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "/opt/Drata Agent/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
