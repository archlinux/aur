# Maintainer: Fabio Di Matteo <pobfdm@gmail.com>
pkgname=pobshare-git
pkgver=0.2
pkgrel=1
pkgdesc="A simple gui for share files. "
arch=('any')
url="https://github.com/pobfdm/pobshare.git"
license=('GPL')
depends=('python-wxpython' 'python-pyftpdlib' 'python-pyopenssl')
conflicts=('pobshare')
source=(https://github.com/pobfdm/pobshare/archive/master.zip)
md5sums=('SKIP') #generate with 'makepkg -g'



package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/pobshare/"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/pobshare-master/pobshare" "$pkgdir/usr/bin/"
  cp -R "$srcdir/pobshare-master/icons/" "$pkgdir/usr/lib/pobshare/"
  cp -R "$srcdir/pobshare-master/locale/" "$pkgdir/usr/lib/pobshare/"
  cp -R "$srcdir/pobshare-master/gui/" "$pkgdir/usr/lib/pobshare/"
  cp "$srcdir/pobshare-master/"*.py "$pkgdir/usr/lib/pobshare/"
  cp "$srcdir/pobshare-master/"*.desktop "$pkgdir/usr/share/applications/"
}
