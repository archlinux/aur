maintainer=user981257923
pkgname=vital-synth
pkgver=1.5.4
pkgrel=1
pkgdesc="Spectral warping wavetable synth."
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
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/bonecountysheriff/${pkgname_deb}/releases/download/${pkgver}/${pkgname_deb}.deb")
sha512sums_x86_64=('e0e1f4be09df2e0c65fc2af8fcb36bbe0b0610345e07cb3771baa69af277b16bcb380af6e4d5fd90c6579e359d543cb91883cbb4bf75eccbb752872da98456e3')

package() {
    # echo $pkgdir
    # pwd
    # ls

	## Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

    ## license seems to not be included anymore
	# install -D -m644 "${pkgdir}/usr/share/doc/vital/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
