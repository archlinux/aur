# Maintainer: Catriel Müller <catriel at gmail dot com>
pkgname=synergy1-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('unknown')
depends=('avahi>=0.6.16' 'gcc-libs>=5.2' 'glibc>=2.14' 'hicolor-icon-theme' 'libx11>=1.2.99.901' 'libxext' 'libxi>=1.2.99.4' 'libxtst' 'openssl>=1.1.0' 'qt5-base>=5.12.2')
conflicts=('synergy')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://binaries.symless.com/synergy/v1-core-standard/1.13.1-stable.063519a8/synergy_1.13.1-stable.063519a8_ubuntu20_amd64.deb")
sha512sums_x86_64=('872c6a4d6f3fdc79d398505f0631d106dd710d4dd828b7ef08136ba91d32550cddadddad5dbedfce844788607a95645f11840a450a20de7eaefc7c4c39239f17')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
