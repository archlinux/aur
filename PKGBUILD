# Maintainer: liberodark

pkgname=cudatext
pkgver=1.34.2.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('xdg-utils')
source_x86_64=("https://netix.dl.sourceforge.net/project/cudatext/release/Linux/cudatext_${pkgver}-1_gtk2_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('748cbc1af5ec9a11e1544a93f3e3768a2fd9b436360c69b03aa3e0f013d109ff4db76b14e5bd1900446f857cad4365ef41f8ce370020df10fa852e9d5a3d4cac'
         'bf6a4409b8462ac6b9c87cbc554cf1837a7b45ec8859b2cdcbb7b263143da9f6236d074d65aca2044dd2475290c9594e6946ccce1c4e58c1cc44dd5ec78ecfc4')
sha512sums_x86_64=('b86f0db7188fb177bfaf5307e2bc3077ee91c2071ad9a4154589d70e6dd37dc5a913feaa3b01c3df91d6d39f9d103e6ced86990f6b5aafaa1e85433f6b231e40')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
