# Maintainer : Frederic Bezies < fredbezies at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: milko

pkgname=arnold-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="An Amstrad CPC emulator using SDL with a WxGTK interface - Binary package"
arch=('x86_64')
url='http://www.cpctech.org.uk/'
depends=('wxgtk2' 'sdl')
license=('GPL')
conflicts=('arnold')
replaces=('arnold')
source=('http://cpctech.cpc-live.com/arnold_1.0.0-1_amd64.deb' arnold.desktop arnold.png)
sha256sums=('28874e9c758a2c3a92bf50d475b67d985ba7f4683b63452c3d1fa93061e51752'
            'c58dc13b7f92a84b688fbd037991aed054a727ee04206efdefc272c95e9a2772'
            '45aa62abcd36f125a4d47dbe2569b21a52068b57138c138814d35188dd5e49d5')

package () {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"  
  install -D -m644 "$srcdir"/arnold.desktop "$pkgdir"/usr/share/applications/arnold.desktop
  install -D -m644 "$srcdir"/arnold.png "$pkgdir"/usr/share/pixmaps/arnold.png
}


