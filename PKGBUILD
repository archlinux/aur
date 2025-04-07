# Contributor: neagix
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com> 

pkgname=idesk-extras
pkgver=1.37
pkgrel=6
pkgdesc="graphical configuration for idesktop plus icons"
arch=('i686' 'x86_64')
license=('GPL')
url="https://web.archive.org/web/20070921005027/http://users.netwit.net.au/~pursang/idesk-extras.html"
depends=('idesk' 'xdialog') 
source=(https://github.com/neagix/idesk-extras/archive/refs/tags/v1.37.zip)
sha256sums=('f9fe75b471523abc81584b6606a738d157fa632ad6d7aa0ef831ed92c55117a5')

package() {
  install -D -m 755 $srcdir/$pkgname-$pkgver/idesktool \
  $pkgdir/usr/bin/idesktool
  mkdir -p $pkgdir/usr/share/idesk
  cp -r $srcdir/$pkgname-$pkgver/icons \
  $pkgdir/usr/share/idesk/
}
