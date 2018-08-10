# Maintainer: liberodark

pkgname=justmd
pkgver=1.1.1
pkgrel=1
pkgdesc="Markdown Editor"
arch=('x86_64')
url="http://www.i38.me/justmd/"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/i38/justmd/releases/download/v1.1.1/justmd-linux-x64-v1.1.1.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('a1f4ab5f4dfc0b10c80b80f6d94473c017debbc291b247c02cbc3bbe8e54b9cea6aa8727b4c58c8197a4e354e85addb44d4b8890c4c326c29f1c4a9aa88267b3'
         '34a7bc2f4eb10247c198f23d8680a084cae7e13cbd39fd3717fec61a5851e632e466ae5649c81c4f16b8ad1436e12c1f9fa4d5a4b471c3af9797f9681748a034')
sha512sums_x86_64=('b9a4299c29371c33720ab270ead17eebf83512f5e7df7a110de34b41fc9ac3b95dab6ca71aaa7486b2a2afdbacc62a17eba9d1468846558c34ecdc6ee05cf56b')
        
package() {
  cd $srcdir
  tar xvf justmd-linux-x64-v1.1.1.tar.gz
  mkdir -p "$pkgdir/opt/justmd"
  cp -r "justmd-linux-x64/." "$pkgdir/opt/justmd"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

