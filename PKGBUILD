# Maintainer: jackreeds <jackreeds at git>
maintainer=jackreeds
pkgname=vital-synth
pkgver=1.0.8
pkgrel=1
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
# arch=('x86_64' 'i686')
arch=('x86_64')
url="https://vital.audio"
license=('custom')
provides=('vital')
# groups=('pro-audio' 'lv2-plugins' 'vst-plugins' 'vst3-plugins')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
# optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
# options=('!strip' '!emptydirs')
install=${pkgname}.install
pkgname_deb="VitalInstaller"
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/${maintainer}/${pkgname_deb}/releases/download/${pkgver}/${pkgname_deb}.deb")
sha512sums_x86_64=('829d29a0c41ac9f79ca6d069e2e4f404a501abdcdc487fbb4e1e8afd44bf870c6c41095587c98f810fb946d946179468f8d5f417e67785313152a1613cf4a832')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
