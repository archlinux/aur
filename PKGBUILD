# Maintainer: Jason Briggs https://github.com/briggsoft
pkgname=pxplus-ibm-vga8
pkgver=1.0
pkgrel=1
license=('unknown')
pkgdesc="Font Package"
arch=('any')
url="https://github.com/briggsoft/Fontpkg-PxPlus_IBM_VGA8"
depends=(fontconfig xorg-font-utils)
source=("https://github.com/briggsoft/Fontpkg-PxPlus_IBM_VGA8/raw/master/PxPlus_IBM_VGA8.ttf")
md5sums=('0bae535590ffdc6ffb2cfa45b8fb2ae3')
install=$pkgname.install

package() {
install -Dm644 PxPlus_IBM_VGA8.ttf "$pkgdir"/usr/share/fonts/TTF/PxPlus_IBM_VGA8.ttf
}
