# Maintainer: liberodark

pkgname=quick-n-easy-web-builder-5
pkgver=5.4.2
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url="http://www.quickandeasywebbuilder.com/"
license=('Custom')
depends=('xdg-utils' 'awesome-terminal-fonts' 'lib32-gtk2' 'lib32-libpng12')
source_x86_64=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-5_${pkgver}_i386.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('bcf377d2eb1514d0bc0207849b6c7e5e1cf962bd2e4fab9e080254df8797fd4345375af86aff5718da593e780fd2aeb32b3da449fde85d644a5f398d1cf0ab1e'
         'a240efc6eb01f3bccddcd5bc4dfa0c91f5ad7ec615293a0832a46c117f9c6e321bc3e25c1d38b7e07577980f2bea85a101105a771130023be6683c0386d46262')
sha512sums_x86_64=('38fce4389ac02b9a4cc0d2e426e51c49e3a175a6cb138853c98f342b28954e4b69da9865ca5ad1ef2fc5b5abe5eab2cf221494fc6411718e116ed48b2bfb2841')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}