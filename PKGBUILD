# Maintainer: liberodark

pkgname=frostwire
pkgver=6.5.6
pkgrel=1
pkgdesc="Undelete and data recovery software"
arch=('x86_64')
url="http://www.frostwire.com"
license=('custom')
depends=('xdg-utils'
         'jre')
source_x86_64=("https://github.com/liberodark/FrostWire/releases/download/${pkgver}/frostwire-${pkgver}.noarch.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
        
package() {
  cd $srcdir
  tar xvf frostwire-${pkgver}.noarch.tar.gz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

sha512sums=('74bd30910ce5ba1bf3e5a7bfa3d29df00e02b5607e94840682508a0fddcb5327a08b1c214c2a2d42ccd32657ef1e8b7562b3bfd9579bb8a41aa995ed82a88a27'
         'f0172d8d8435ddbc96e3f3e8ce6f09869ade1b9a32ef3930ae2f8b2522af121f6b2d37e9e8eb081561715845d9bb73f027c848a3756126d3ac989a861bfe2a4e')
sha512sums_x86_64=('7a7e089fa8ca0e99760d2600d8bd7d0c28b693d9865987467d079f1cb99ade060bb69cf8d7f1156906108b9cc1534b238d52f6240b40df0ae8f987761b98a163')
