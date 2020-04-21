# Maintainer: Tom Wizetek <tom@wizetek.com>

pkgname=freepats-ydp-grand-piano
pkgver=20160804
pkgrel=1
pkgdesc="Yamaha Disklavier Pro grand piano sf2 SoundFont"
arch=('any')
url="http://freepats.zenvoid.org/Piano/acoustic-grand-piano.html"
license=('cca-by-3.0')
groups=('soundfonts')
optdepends=('fluidsynth' 'qsynth')
_corename="YDP-GrandPiano"
_tarname="${_corename}-SF2-${pkgver}"
_sf2name="${_corename}-${pkgver}"
source=("http://freepats.zenvoid.org/Piano/${_corename}/${_tarname}.tar.bz2")
md5sums=('cd216d04641c8a7c75147444494cd602')

package() {
  install -Dm644 "${srcdir}/${_tarname}/${_sf2name}.sf2" -t "${pkgdir}/usr/share/soundfonts"
  install -Dm644 "${srcdir}/${_tarname}/${_sf2name}.txt" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
