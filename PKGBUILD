# Maintainer: milk on freenode
pkgname="soundfont-sunshine-perc"
pkgdesc="Five drum/percussion soundfonts from Sunshine Studios. Non-commercial use only."
pkgver=1
pkgrel=1
arch=('any')
url="http://mugglinworks.com/soundfonts/"
license=('custom')
groups=('soundfonts')
source=(git+https://github.com/mxmilkb/sunshine-drums-sf2)
sha1sums=('SKIP')

package() {
  cd $srcdir/sunshine-drums-sf2
   install -D -m644 NaturalIsland.sf2 "${pkgdir}/usr/share/soundfonts/NaturalIsland.sf2"
   install -D -m644 PVCDrum.sf2 "${pkgdir}/usr/share/soundfonts/PVCDrum.sf2"
   install -D -m644 RemoDjembe.sf2 "${pkgdir}/usr/share/soundfonts/RemoDjembe.sf2"
   install -D -m644 Shekeres.sf2 "${pkgdir}/usr/share/soundfonts/Shekeres.sf2"
   install -D -m644 TocaMiniDjembe.sf2 "${pkgdir}/usr/share/soundfonts/TocaMiniDjembe.sf2"
}
