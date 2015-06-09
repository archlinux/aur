# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-extension-desktop-scroller
pkgver=2.02
pkgrel=1
pkgdesc="This extension enables you to quickly switch between workspaces"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/extensions/view/17"
license=('GPL')
groups=('cinnamon-extension')
depends=('cinnamon')
#install=$pkgname.install
_source=8ZBW-QO9X-ZLA5.zip
_extension=Desktop-Scroller--Cinnamon-
source=("http://cinnamon-spices.linuxmint.com/uploads/extensions/$_source")
md5sums=('1a29c5b1c11421f088377a5b4364a5df')

package() {
  cd $srcdir/$_extension
  install -dpm755 $pkgdir/usr/share/cinnamon/extensions/$_extension
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/extensions/$_extension/ \;
}
