# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-extension-desktop-scroller
pkgver=1.1
pkgrel=2
pkgdesc="This extension enables you to quickly switch between workspaces"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/extensions/view/17"
license=('GPL')
groups=('cinnamon-extension')
depends=('cinnamon')
#install=$pkgname.install
_source=G7HH-IZCS-GGW3.zip
_extension=desktop-scroller@ccadeptic23
source=("http://cinnamon-spices.linuxmint.com/uploads/extensions/$_source")
md5sums=('a5f8aa12381a071d3ae74981552225d0')

package() {
  cd $srcdir/$_extension
  install -dpm755 $pkgdir/usr/share/cinnamon/extensions/$_extension
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/extensions/$_extension/ \;
}
