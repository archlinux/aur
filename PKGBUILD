# Maintainer: hu3rror <hu3rror@protonmail.com>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.9
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
sha512sums_i686=('1ab397bd010b159890114f2664a76ec7fa2d32764dcf9186a9602ec3b51df6fa2b548c9d86e4b117d4c63631377bdb851fc0b1004ba9d48f07d6fbbd04ab1470')
sha512sums_x86_64=('1ab397bd010b159890114f2664a76ec7fa2d32764dcf9186a9602ec3b51df6fa2b548c9d86e4b117d4c63631377bdb851fc0b1004ba9d48f07d6fbbd04ab1470')
sha512sums_aarch64=('63083459b7a635d4e0f716a34da69b91fdd152876b9f0f7917185d527f09bd184ca1556f5c299ad21b04e15e8259108fd23f25d3a1d8ae4b9c67ae0c17f143bf')


package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
