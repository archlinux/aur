pkgname="cinnamon-theme-numix-darkred"
pkgver=0.2
pkgrel=1
pkgdesc="A Cinnamon Theme"
arch=('any')
url='https://cinnamon-spices.linuxmint.com/themes/view/496'
license=('unknown')
source=("https://cinnamon-spices.linuxmint.com/uploads/themes/054P-KVVX-JJN7.zip")
md5sums=('SKIP')

depends=('cinnamon' 'unzip')

package() {

  mkdir -p "$pkgdir/usr/share/themes/NumixDarkRed"

  cp -r \
      "$srcdir/NumixDarkRed/" \
      "$pkgdir/usr/share/themes/"
}
