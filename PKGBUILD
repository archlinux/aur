# Maintainer: Catriel Müller <catriel at gmail dot com>
pkgname=synergy1-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('unknown')
groups=('')
depends=('avahi>=0.6.16' 'gcc-libs>=5.2' 'glibc>=2.14' 'hicolor-icon-theme' 'libx11>=1.2.99.901' 'libxext' 'libxi>=1.2.99.4' 'libxtst' 'openssl>=1.1.0' 'qt5-base>=5.12.2')
conflicts=('synergy')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://binaries.symless.com/synergy/v1-core-standard/1.13.0-stable-bdb8f767/synergy_1.13.0-stable.bdb8f767_ubuntu20_amd64.deb")
sha512sums_x86_64=('d259272548db370a948bb3d97a1c4b2469eebbbb1aa079896bcf25ebe26ecd25331ada7e6d58fde125599a436e8d28c9a9e62cbfa834260cf1ccb9f6a76c23b6')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
