# Maintainer: altaway <email@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.3
pkgrel=2
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
# arch=('x86_64' 'i686')
arch=('x86_64')
url="https://vital.audio"
license=('custom')
groups=('')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
# optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/altaway/VitalInstaller/releases/download/v1.0.3-2/VitalInstaller.deb")
sha512sums_x86_64=('c1b4a1bfc8bb90f8a4da2c25fdae4210af9fdf1478c33b07162b2d85cb606952dca72aa987904acf0ac2fab3182ee3873e4109d160ab02d44e09ec451f41f2ca')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
