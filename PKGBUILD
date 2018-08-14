# Maintainer: liberodark

pkgname=yosoro
pkgver=1.0.8
pkgrel=1
pkgdesc="Beautiful Cloud Drive Markdown NoteBook Desktop App."
arch=('x86_64')
url="https://github.com/IceEnd/Yosoro"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/Yosoro/releases/download/1.0.8/yosoro_1.0.8_amd64.deb")
sha512sums_x86_64=('8cc8ceee66ca34137227c4d4932f48ccf8960d9c54e2fa5249b94347dd29e5752ef28b072baddc1704321e7f2f8481eb384eeefccb28936205b4ec6d809973a2')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

