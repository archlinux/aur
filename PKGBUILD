# Maintainer: liberodark

pkgname=odrive-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Google Drive GUI"
arch=('x86_64')
url="https://github.com/liberodark/ODrive"
license=('GPL')
depends=('xdg-utils' 'electron' 'nodejs')
source_x86_64=("https://github.com/liberodark/ODrive/releases/download/0.1.0/odrive-0.1.0.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('21f1af6ea861679b8338daad978ace9f66e2177d1897643f87aacd291ca5a35ddab50efee3dfcdbd4fbb015bdaf8f0589ef90fbec7c8e0ad3a71cfa32e7ea18b'
         'e852e6ee2714900b2b484dbe3f9bb69e72895391fed5e6776142c48daaf7e75a8a12908812894e5695277447bd2704cad93cd4f2ed0940ef45008e93b8823dd1')
sha512sums_x86_64=('141b55fb50141fa5dcd47c73b584b947dd8833ebb699f0e70208584a3063002ad7a42d264a2890814ffbeb3306a98252227793c069d00fb7677fe6c6afd37a89')
        
package() {
  cd $srcdir
  tar xvf odrive-0.1.0.tar.gz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

