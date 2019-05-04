# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=menugenerator
_pkgname=MenuGenerator
pkgver=1.0
pkgrel=1
pkgdesc="A simple menu generator for fluxbox openbox jwm that uses xdg-menu."
arch=('any')
url="https://github.com/BlackCodec/MenuGenerator/tree/master"
license=('GPL')
depends=('python-xdg' 'python-cairosvg')
optdepends=('lxmenu-data: menu data')
source=("https://github.com/BlackCodec/MenuGenerator/archive/$pkgver.zip")
md5sums=('974710695a3509b87c711811ae593105')

package() {
   install -Dm 755 "$srcdir/$_pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

