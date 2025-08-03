# Maintainer : CyrIng
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: milko

pkgname=arnold-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="An Amstrad CPC emulator using SDL with a WxGTK interface - Binary package"
arch=('x86_64')
url='https://sourceforge.net/projects/arnold.berlios/'
depends=('gtk2' 'sdl12-compat' 'libpulse')
license=('GPL')
conflicts=('arnold')
replaces=('arnold')
source=('https://sourceforge.net/projects/arnold.berlios/files/arnold-nurgle-x86_64-2009-03-17.tar.bz2/download' arnold.desktop arnold.png)
sha256sums=(SKIP
            'c58dc13b7f92a84b688fbd037991aed054a727ee04206efdefc272c95e9a2772'
            '45aa62abcd36f125a4d47dbe2569b21a52068b57138c138814d35188dd5e49d5')

package () {
  install -D -m755 "$srcdir"/arnold-nurgle-x86_64-2009-03-17/arnold "${pkgdir}/usr/bin/arnold"
  install -D -m644 "$srcdir"/arnold.desktop "$pkgdir"/usr/share/applications/arnold.desktop
  install -D -m644 "$srcdir"/arnold.png "$pkgdir"/usr/share/pixmaps/arnold.png
}
