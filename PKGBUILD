# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: hu3rror <hu3rror@protonmail.com>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.11
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('b26ca88ae7c2aaa1f5956ded92baa022d4ad47b528983f091b9eef4ecd058a69116e43f17b8f264ff9095a8f7b02eac1efa217b126d3234a6fea74667700026c')
sha512sums_x86_64=('b26ca88ae7c2aaa1f5956ded92baa022d4ad47b528983f091b9eef4ecd058a69116e43f17b8f264ff9095a8f7b02eac1efa217b126d3234a6fea74667700026c')
sha512sums_aarch64=('9145764a67ed98e9a12d98d8a831969377ac4b04335bb340062334d04224eb831209ce5e962b38b4f5df1f682b43423fc4600a71c29d26eae08f2c7182526300')


package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
