# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=docx2txt
pkgver=1.4
pkgrel=1
pkgdesc="Recovers text from DOCX files, with good formatting."
arch=('any')
url="http://docx2txt.sourceforge.net"
license=('GPL')
depends=('perl' 'unzip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('780f468c16d547b02723b98aadc52c63')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make INSTALLDIR="$pkgdir/usr/bin/"
  #make INSTALLDIR="$pkgdir/usr/bin/" install
  # todo, fix these extensions
  install -Dm644 docx2txt.config "$pkgdir/etc/docx2txt.config"
  install -Dm755 docx2txt.pl "$pkgdir/usr/bin/docx2txt.pl"
  install -Dm755 docx2txt.sh "$pkgdir/usr/bin/docx2txt.sh"
}

