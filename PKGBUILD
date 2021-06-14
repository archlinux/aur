# Maintainer: Catriel Müller <catriel at gmail dot com>
pkgname=synergy1-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('unknown')
depends=('avahi>=0.6.16' 'gcc-libs>=5.2' 'glibc>=2.14' 'hicolor-icon-theme' 'libx11>=1.2.99.901' 'libxext' 'libxi>=1.2.99.4' 'libxtst' 'openssl>=1.1.0' 'qt5-base>=5.12.2')
conflicts=('synergy')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://binaries.symless.com/synergy/v1-core-standard/1.14.0-stable.67d824b8/synergy_1.14.0-stable.67d824b8_ubuntu20_amd64.deb")
sha512sums_x86_64=('097a6bf7efb30c28439a6f782b3589d38318afe81f7d1f9b09867b36aaaa8e92b158b024d852d831b7ac8a62efd89742400c99407d36dcfe5bc4723aa2693ca8')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
