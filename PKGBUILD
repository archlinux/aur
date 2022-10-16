# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=menugenerator
_pkgname=MenuGenerator
pkgver=1.1
pkgrel=1
pkgdesc="A simple menu generator for fluxbox openbox jwm that uses xdg-menu."
arch=('any')
url="https://github.com/BlackCodec/MenuGenerator/"
license=('GPL')
depends=('python-xdg' 'python-cairosvg')
optdepends=('lxmenu-data: menu data')
source=("https://github.com/BlackCodec/MenuGenerator/archive/refs/tags/$pkgver.zip")
md5sums=('2d42be97efd7655894a0f6ed54ed19c6')

package() {
   install -Dm 755 "$srcdir/$_pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

