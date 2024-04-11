# Maintainer: kokononine <nine_9@outlook.jp>
pkgname=ugee-tablet
pkgver=4.2.4
_pkgver_sub=240304
pkgrel=1
pkgdesc='Ugee Tablet Driver(version 4.x)'
url='https://www.ugee.com.cn/download/'
source=("https://download.ugee.com.cn/upload/download/20240321/ugeeTablet-$pkgver-$_pkgver_sub.tar.gz")
arch=('x86_64')
license=('custom: commercial')
depends=()
#depends=('libx11' 'libxrender' 'libxrandr' 'libxinerama' 'libxtst' 'libsm' 'libice' 'libglvnd' 'libusb' 'freetype2' 'qt5-x11extras' 'hicolor-icon-theme')
optdepends=()
conflicts=()
provides=()
sha256sums=('9c6f0d8905a0c38ced61f2c5c1822e91d8a155e0128335a0534bfea2523c43c6')

package() {
    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub/App/usr" "$pkgdir/usr"
    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub/App/lib" "$pkgdir/usr"
#    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub/App/etc" "$pkgdir/etc"
}
