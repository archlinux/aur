# Maintainer: liberodark

pkgname=yosoro
pkgver=1.1.1
pkgrel=1
pkgdesc="Beautiful Cloud Drive Markdown NoteBook Desktop App."
arch=('x86_64')
url="https://github.com/IceEnd/Yosoro"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/Yosoro/releases/download/1.0.8/yosoro_1.0.8_amd64.deb")
sha512sums_x86_64=('f94fa0d9a7661464bbe7252c356aecbb7c223b74283ce90e1ea2948921cd3c6314ee706d1f9a764e0a1896639bc9014af8c80d6722b5511d0b28ddf81434c1a9')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

