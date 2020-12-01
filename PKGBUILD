# Maintainer: altaway <email@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.3
pkgrel=4
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
sha512sums_x86_64=('e16cf3a43bf8c3f5e5d18ad23edb17629d95b9d0cbb2cef4ff0d5deb0197fafe7a702d63ee893dba31fe2e2e79e7a0c9fbc1d3ea0663d7234205c0bc98727db2')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
