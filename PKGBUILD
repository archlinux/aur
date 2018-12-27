# Maintainer: Szymon Scholz
pkgname=nagios-images
pkgver=0.9.2
pkgrel=1
pkgdesc="Collection of images and icons for the nagios system"
arch=('any')
url="http://www.nagios.org/"
license=('GPL')
#depends=('python' 'pygtk' 'gnome-python-extras' 'python-lxml')
#makedepends=('deb2targz')
source=(http://ftp.de.debian.org/debian/pool/main/n/nagios-images/nagios-images_$pkgver.tar.gz)

package() {
  mkdir -p "$pkgdir/usr/share/nagios/share/images/logos"
  cp -r "$srcdir"/nagios-images-$pkgver/* "$pkgdir/usr/share/nagios/share/images/logos/"
}
md5sums=('c8a563dda86e79a55f6b163003541ba6')
