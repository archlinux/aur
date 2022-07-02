# Maintainer: https://github.com/pocketfood
pkgname=pxplus-ibm-vga8
pkgver=1.3
pkgrel=1
license=('CC BY-SA 4.0')
pkgdesc="Really pretty looking monospace system font in the styles of regular, italic and underline."
arch=('any')
url="https://github.com/pocketfood/Fontpkg-PxPlus_IBM_VGA8"
depends=(fontconfig)
source=("https://github.com/pocketfood/Fontpkg-PxPlus_IBM_VGA8/raw/master/PxPlus_IBM_VGA8.ttf")
md5sums=('0bae535590ffdc6ffb2cfa45b8fb2ae3')
install=$pkgname.install

package() {
install -Dm644 PxPlus_IBM_VGA8.ttf "$pkgdir"/usr/share/fonts/TTF/PxPlus_IBM_VGA8.ttf
}
