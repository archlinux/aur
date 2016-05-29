pkgname="numix-cinnamon-blue-2"
pkgver=1.0
pkgrel=1
pkgdesc="A Cinnamon Theme"
arch=('any')
url='https://cinnamon-spices.linuxmint.com/themes/view/472'
license=('unknown')
source=("https://cinnamon-spices.linuxmint.com/uploads/themes/7OYU-MDLA-SZLD.zip")
md5sums=('SKIP')

depends=('cinnamon' 'unzip')

package() {

  mkdir -p "$pkgdir/usr/share/themes/Numix-Cinnamon-blue-2"

  cp -r "$srcdir/Numix-Cinnamon-blue-2/" "$pkgdir/usr/share/themes/"
}
