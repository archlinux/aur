# Contributor: sxe <sxxe@gmx.de>

pkgname=smplayer-theme-faenza
pkgver=2
pkgrel=2
pkgdesc="Normal, dark and silver faenza theme for smplayer."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/smplayer-theme-faenza?content=156022"
license=('GPL')
depends=('smplayer')
makedepends=('tar')
source=('http://qt-apps.org/CONTENT/content-files/156022-smplayer-theme-faenza-2.tar.gz')
md5sums=('740f2559ca375798cb2a36b6100bbd1b')

package() {
    # Create Destination Directory
    install -d $pkgdir/usr/share/smplayer/themes

    # Install themes
    cp -r $srcdir/faenza-darkest $pkgdir/usr/share/smplayer/themes/
    cp -r $srcdir/faenza-silver $pkgdir/usr/share/smplayer/themes/
    cp -r $srcdir/faenza $pkgdir/usr/share/smplayer/themes/
}
