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
sha512sums=('7512d1c51dc7190c51f73bbb33924e4563e9b6c4d15464da6a88eafec6b34816d946b725e60c8541407044f7181d67f412be65d00e3cd39b1d9d51f0f31e9e08'
         'a240efc6eb01f3bccddcd5bc4dfa0c91f5ad7ec615293a0832a46c117f9c6e321bc3e25c1d38b7e07577980f2bea85a101105a771130023be6683c0386d46262')
sha512sums_x86_64=('38fce4389ac02b9a4cc0d2e426e51c49e3a175a6cb138853c98f342b28954e4b69da9865ca5ad1ef2fc5b5abe5eab2cf221494fc6411718e116ed48b2bfb2841')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}