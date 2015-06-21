# Maintainer: Xyne

pkgname=gtk-theme-murrinapolymer
pkgver=1.5
pkgrel=1
pkgdesc="This light gray GTK theme aims to be clean and easy to our poor eyes."
arch=('any')
url='http://gnome-look.org/content/show.php/MurrinaPolymer?content=122165'
license=('GPL')
depends=('gtk-engine-murrine')
source=('http://dl.dropbox.com/u/465797/MurrinaPolymer.tar.gz')
md5sums=('e123c838382820150cf910874900a130')


build () {
  mkdir -p "$pkgdir/usr/share/themes"
  cp -R "$srcdir/MurrinaPolymer" -t "$pkgdir/usr/share/themes"
  find "$pkgdir/usr/share/themes" -type f -exec chmod 644 {} \+
}
