# Maintainer: hu3rror <hu3rror@protonmail.com>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.8
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
sha512sums_i686=('a756974abc3a905055482951f44e3e38d566ca3bd8c0b333aedae5e2b4e602ac22516d4ba7bffe5528d66ce2f9784e3d548e6d48a33e36e54c56aac0bdea78e0')
sha512sums_x86_64=('a756974abc3a905055482951f44e3e38d566ca3bd8c0b333aedae5e2b4e602ac22516d4ba7bffe5528d66ce2f9784e3d548e6d48a33e36e54c56aac0bdea78e0')
sha512sums_aarch64=('8de1c7dd47a7c80f3f4ec26ada27c92db5cb171ef1c1b9522b4e7e2ef51f729dc50e8be70f0d0e0c552fa124089d94123010559478ce8d9d9188a1f60a08137d')


package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
