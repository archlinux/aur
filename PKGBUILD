# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com> 

pkgname=idesk-extras
pkgver=1.37
pkgrel=6
pkgdesc="graphical configuration for idesktop plus icons"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.jmurray.id.au/idesk-extras.html"
depends=('idesk' 'xdialog') 
source=(http://ftp.nluug.nl/pub/os/Linux/distr/amigolinux/download/DeskTop/IconMgmt/idesk-extras-1.37/idesk-extras-1.37.tar.bz2)
md5sums=('05d570d04cc8eb18b5d5486676b84b8b')

package() {
  install -D -m 755 $srcdir/$pkgname-$pkgver/idesktool \
  $pkgdir/usr/bin/idesktool
  mkdir -p $pkgdir/usr/share/idesk
  cp -r $srcdir/$pkgname-$pkgver/icons \
  $pkgdir/usr/share/idesk/
}
