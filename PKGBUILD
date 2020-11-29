# Maintainer: altaway <email@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.3
pkgrel=3
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
# arch=('x86_64' 'i686')
arch=('x86_64')
url="https://vital.audio"
license=('custom')
# groups=('pro-audio' 'lv2-plugins' 'vst-plugins' 'vst3-plugins')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
# optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/altaway/VitalInstaller/releases/download/v${pkgver}-${pkgrel}/VitalInstaller.deb")
sha512sums_x86_64=('7a38bf53df1f9ac61591ac4d117786f589091f1c34aa161e287f965d6c5e03b65dddc4034c3d787c9f10e0a216361f73bd64d046cc0968428a2d1cf7f924e01b')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
