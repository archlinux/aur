pkgname="numix-cinnamon-green-2"
pkgver=1.0
pkgrel=1
pkgdesc="A Cinnamon Theme"
arch=('any')
url='https://cinnamon-spices.linuxmint.com/themes/view/473'
license=('unknown')
source=("https://cinnamon-spices.linuxmint.com/uploads/themes/A6CP-36R7-INJ8.zip")
md5sums=('SKIP')

depends=('cinnamon' 'unzip')

package() {

  mkdir -p "$pkgdir/usr/share/themes/Numix-Cinnamon-green-2"

  cp -r "$srcdir/Numix-Cinnamon-green-2/" "$pkgdir/usr/share/themes/"
}
