# Maintainer: liberodark

pkgname=yosoro-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="Beautiful Cloud Drive Markdown NoteBook Desktop App."
arch=('x86_64')
url="https://github.com/IceEnd/Yosoro"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/IceEnd/Yosoro/releases/download/v1.1.5/Yosoro-linux.deb")
sha512sums_x86_64=('81889d8c4f450ef6a76eb0a24fadc6c1c4718f7ffa6a759b46466e4b84587f56112d245b04b5175ed77abf7799463073c3168dc92dd383144d87508621deb08d')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

