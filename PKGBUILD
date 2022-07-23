# Maintainer: hu3rror <hu3rror@protonmail.com>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.7
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums_i686=('a24f5d8e1716d14421aa28524a2e550b79fd447c44a182c212f817a893b609e88b39c817cda790b3708c55756bb6bc43f9ee22aeb328b0b1578024568e91688c')
sha512sums_x86_64=('a24f5d8e1716d14421aa28524a2e550b79fd447c44a182c212f817a893b609e88b39c817cda790b3708c55756bb6bc43f9ee22aeb328b0b1578024568e91688c')


package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
