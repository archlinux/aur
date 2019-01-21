# Maintainer: liberodark

pkgname=zero-k
pkgver=1.0
pkgrel=1
pkgdesc="Open source RTS game running on the Spring engine"
arch=('x86_64')
url="https://github.com/ZeroK-RTS/Zero-K"
license=('GPL-2.0')
depends=('mono' 'openal' 'libcurl-compat')
source=("https://github.com/liberodark/zero-k/releases/download/1.0/zero-k.deb")
sha512sums=('0447e7de77260bfd6f0c88083cc0626397ac42229dc02b74c78d0e6ed36eb71444b60207c04c50fa527db0c14c46e79f32f9d08a66e1d0ce20edb4cbadacab07')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}
