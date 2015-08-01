# Maintainer: Valsu [arch(at)hylia.de]

pkgname=timgm6mb
pkgver=1
pkgrel=1
pkgdesc="A low-overhead soundfont for software synthesizers"
url="http://ocmnet.com/saxguru/Timidity.htm"
arch=('any')
license=('GPL2')
source=("http://sourceforge.net/p/mscore/code/HEAD/tree/trunk/mscore/share/sound/TimGM6mb.sf2?format=raw")
md5sums=('1f1ad87ae6f87033d9a591eca567d919')

package() {
  install -D -m655 "${srcdir}/TimGM6mb.sf2?format=raw" "${pkgdir}/usr/share/soundfonts/TimGM6mb.sf2"
}

# vim:set ts=2 sw=2 et:
