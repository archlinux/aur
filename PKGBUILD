# Maintainer: altaway <email@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.3
pkgrel=1
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
arch=('x86_64' 'i686')
url="https://vital.audio"
license=('custom')
groups=('')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/altaway/VitalInstaller/releases/download/v1.0.3-1/VitalInstaller.deb")
sha512sums_x86_64=('2ebe787b6eb58148c7026a3e584890b4a1769e0044b1d59182c38b82c34c653f564c4dbf7f13ce673bdeadd8ce4afcebacec809605e890ab59f275372ee5fa7c')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
