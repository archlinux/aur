
# Maintainer: Valsu [arch(at)hylia.de]

pkgname=soundfont-timgm6mb
pkgver=1
pkgrel=2
pkgdesc="A low-overhead soundfont for software synthesizers"
url="http://ocmnet.com/saxguru/Timidity.htm"
arch=('any')
license=('GPL2')
source=("http://sourceforge.net/p/mscore/code/HEAD/tree/trunk/mscore/share/sound/TimGM6mb.sf2?format=raw" 
	"timidity-timgm6mb.cfg")
md5sums=('1f1ad87ae6f87033d9a591eca567d919'
         'a9e24f8f2f7d7f814b63b3538a88c6ee')

package() {
  install -D -m644 "${srcdir}/TimGM6mb.sf2?format=raw" "${pkgdir}/usr/share/soundfonts/TimGM6mb.sf2"
  install -D -m644 "${srcdir}/timidity-timgm6mb.cfg" "${pkgdir}/etc/timidity++/timidity-timgm6mb.cfg"
}

# vim:set ts=2 sw=2 et:
