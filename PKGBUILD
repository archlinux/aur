# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-better-places
pkgver=1.2.1
pkgrel=1
pkgdesc="A Better Places Cinnamon Applet"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/54"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/PUXO-VDMY-NB96.zip")
md5sums=('b69c9191fa2513f88b106f9dd9b8f6f5')
_applet=betterplaces@bownz

build() {
  cd $srcdir/$_applet
  rm *~
}

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
