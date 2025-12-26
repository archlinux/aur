# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=menugenerator
_pkgname=MenuGenerator
pkgver=1.2
pkgrel=1
pkgdesc="A simple menu generator for fluxbox openbox jwm that uses xdg-menu."
arch=('any')
url="https://github.com/BlackCodec/MenuGenerator/"
license=('GPL')
depends=('python-xdg' 'python-cairosvg')
optdepends=('lxmenu-data: menu data')
source=("https://github.com/BlackCodec/MenuGenerator/archive/refs/tags/$pkgver.zip")
md5sums=('2db111f3964a2ba691a83f85dfcb95e2')

package() {
   install -Dm 755 "$srcdir/$_pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

