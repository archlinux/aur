# Maintainer: altaway <aur@altaway.uk> 
pkgname=vital-synth
pkgver=1.0.7
pkgrel=1
pkgdesc="Powerful wavetable synthesizer with realtime modulation feedback. Vital is a MIDI enabled polyphonic music synthesizer with an easy to use parameter modulation system with real-time graphical feedback."
# arch=('x86_64' 'i686')
arch=('x86_64')
url="https://vital.audio"
license=('custom')
# groups=('pro-audio' 'lv2-plugins' 'vst-plugins' 'vst3-plugins')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'gcc-libs' 'gcc>=3.3.1' 'glib2>=2.12.0' 'glibc>=2.17' 'libcurl-gnutls>=7.16.2' 'libgl' 'libglvnd' 'libsecret>=0.7')
# optdepends=('aarch64-linux-gnu-gcc>=5: support for aarch64')
# options=('!strip' '!emptydirs')
install=${pkgname}.install
pkgname_deb="VitalInstaller"
source_x86_64=("${pkgname_deb}-${pkgver}-${pkgrel}.deb::https://github.com/altaway/${pkgname_deb}/releases/download/${pkgver}/${pkgname_deb}.deb")
sha512sums_x86_64=('d82d685dc7868726d02c9586a6cee2bb49bf9a0763f5fed083559b9c02af3d1638e1cbc7b47556bc8032c28bb969d99d568570de1f31da710e5b80afd0fcf13c')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
