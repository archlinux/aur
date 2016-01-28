# Author: Aliaksandr Stelmachonak a.k.a ava1ar <mail.avatar at gmail.com>
# moved to AUR4: GI_Jack <iamjacksemail@hackermail.com>

pkgname=thunar-djvu-thumbnailer
pkgver=0.1
pkgrel=4
pkgdesc="Adds support of DjVu thumbnail to Thunar file manager" 
license=('GPL')
arch=('i686' 'x86_64')
depends=('evince')
url="http://thunar.xfce.org" 
install=thunar-djvu-thumbnailer.install
source=(https://dl.dropboxusercontent.com/u/4514366/AUR/${pkgname}-${pkgver}.tar.gz) 
sha256sums=('c3c78820fc4aa44b6e722ce9202257c32b83c2635a06f2a5b006b7505dec9bfb')

package()
{ 
  	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -m 755 djvu-thumbnailer ${pkgdir}/usr/lib/xfce4/djvu-thumbnailer
	install -D -m 644 djvu-thumbnailer.desktop ${pkgdir}/usr/share/thumbnailers/djvu-thumbnailer.desktop
}
