# Maintainer: Fabio Di Matteo <pobfdm@gmail.com>
pkgname=pobshare
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Pobshare is A simple gui for share files. "
arch=('any')
url="https://github.com/pobfdm/pobshare"
license=('GPL')
groups=('Utility')
depends=('python-wxpython' 'python-pyftpdlib')
makedepends=('')
checkdepends=()
#optdepends=('')
provides=('pobshare')
conflicts=('pobshare')
replaces=()
backup=()
#options=( '')
install=
changelog=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
source=(https://github.com/pobfdm/pobshare/archive/master.zip)
md5sums=('SKIP') #generate with 'makepkg -g'


build() {
  echo "Nothing to build..."
  
}


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
