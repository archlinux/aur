# Maintainer: liberodark

pkgname=cudatext
pkgver=1.22.0.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('xdg-utils')
source_x86_64=("https://10gbps-io.dl.sourceforge.net/project/cudatext/release/Linux/cudatext_1.22.4.0-1_gtk2_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('748cbc1af5ec9a11e1544a93f3e3768a2fd9b436360c69b03aa3e0f013d109ff4db76b14e5bd1900446f857cad4365ef41f8ce370020df10fa852e9d5a3d4cac'
         'bf6a4409b8462ac6b9c87cbc554cf1837a7b45ec8859b2cdcbb7b263143da9f6236d074d65aca2044dd2475290c9594e6946ccce1c4e58c1cc44dd5ec78ecfc4')
sha512sums_x86_64=('a904f66b2c5baa1cce84d0125d43fc9ff4a1e739b71427302474319f1eff6d116b9efe3457a2d054013c70c4b5a64dba8365567eb50b734fe7ee680a5ac2937a')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
