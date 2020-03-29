# Maintainer: Pavel Horniak <gouster4@gmail.com>
pkgname=newflasher-git
pkgver=20
pkgrel=1
pkgdesc='This experimental software allows you to flash firmwares acquired through XperiFirm to Sony phones including and newer than the XZ Premium.'
arch=('x86_64')
license=('GPL')
url="https://forum.xda-developers.com/crossdevice-dev/sony/progress-newflasher-xperia-command-line-t3619426"
depends=('zlib' 'expat')
source=(git://github.com/newflasher/newflasher)
md5sums=('SKIP')

build() {
    cd "$srcdir"/newflasher
    make
}

package(){
  # Moving everything to pkg/.
  mkdir "$pkgdir"/usr "$pkgdir"/usr/bin
  mv "$srcdir"/newflasher/newflasher "$pkgdir"/usr/bin/newflasher
}
