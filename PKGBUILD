pkgname=nagios-images
pkgver=0.8
pkgrel=3
pkgdesc="Collection of images and icons for the nagios system"
arch=('any')
url="http://www.nagios.org/"
license=('GPL')
#depends=('python' 'pygtk' 'gnome-python-extras' 'python-lxml')
#makedepends=('deb2targz')
source=(http://ftp.de.debian.org/debian/pool/main/n/nagios-images/nagios-images_$pkgver.tar.gz)
md5sums=('0b41a448c011becb75925685131d201d')

package() {
  mkdir -p "$pkgdir/usr/share/nagios/share/images/logos"
  cp -r "$srcdir"/nagios-images-$pkgver/* "$pkgdir/usr/share/nagios/share/images/logos/"
}
