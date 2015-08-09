# Maintainer: Darshit Shah <darnir@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfwm-axiom-theme
pkgver=1
pkgrel=1
pkgdesc='Inspired by the metacity theme "fresh". Two xfwm themes are included, axiom for bright themes and axiomd for dark themes.'
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/axiom?content=90145"
license=('GPL')
source=(http://xfce-look.org/CONTENT/content-files/90145-axiom.tar.gz)
noextract=()
md5sums=('e9fd9f41f671afa17b3efbf43f0008de')

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -R $srcdir/{axiom,axiomd} $pkgdir/usr/share/themes
}
