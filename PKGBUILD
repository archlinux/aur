# Maintainer: liberodark

pkgname=nighthawk
pkgver=1.1.0
pkgrel=1
pkgdesc="A stealthy, simple, unobtrusive music player that stays out of your way."
arch=('x86_64')
url="https://github.com/quantumkv/nighthawk"
license=('MIT')
depends=('xdg-utils')
source_x86_64=("https://github.com/quantumkv/nighthawk/releases/download/v${pkgver}/nighthawk-linux-v${pkgver}-amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('445d6d4973d6598eddd7e723dd1f9073e63cc4e676d7d257dffbc66a5ddb1394c26c12d0dbce8daaa670f841546a5ada51dca39896c4e9821a4fe6474fecfe42'
         '10afcd81d7caf67c3dc20a8082b07a8db024ada88a1ae5218c0958ee001c4351f9546d351cde49df7064b2c2a89e43ce00fb0caff51aba15d619083a96d71c5d')
sha512sums_x86_64=('9f247f76dbad0e18053d3d45b7728d2dd6315084539b40b6bfd3a1b0b522065c3b9597c9d38d8213fc12084f5d54f8caf7dc88f69b7d3c6889469aab43af156d')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

