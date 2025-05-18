pkgname=cattheme
pkgver=0.1
pkgrel=1
pkgdesc="Spinning Cat Plymouth Theme by mango7006"
arch=('any')
url="https://github.com/mango7006/cattheme"
license=('unlicense')
depends=('plymouth')

source=("git+https://github.com/mango7006/cattheme.git")
md5sums=('SKIP')

package() {
  echo "Thank you for using my theme :) "
  install -d "$pkgdir/usr/share/plymouth/themes/cattheme"
  cp -r "$srcdir/cattheme/"* "$pkgdir/usr/share/plymouth/themes/cattheme/"
}
