# Maintainer: zhullyb <5435486@qq.com>

pkgname=purewriter
pkgver=0.2.2
pkgrel=1
pkgdesc="Pure Writer Desktop"
arch=('x86_64')
url="https://github.com/LiarOnce/purewriter-desktop-liaronce-build"
install=.INSTALL
license=('GPL3')
depends=('jre8-openjdk' 'java8-openjfx')
source=("https://github.com/LiarOnce/purewriter-desktop-liaronce-build/releases/download/0.2.2/PureWriter-linux_x86-64.zip"
  ".INSTALL"
  "purewriter.desktop"
  "purewriter.png")
  
md5sums=('38ea9a8edd6e8e79ea83495362f07cc2'
  '840aee871b202cd5f3b0fd7a8d8df491'
  '21d49b2af7ea7bf5ebba7a7a0648a29d'
  'ab8d4aef028cd77876b8cf67e4439afb')

package() {
    cd "$srcdir"
    mkdir -p $pkgdir/usr/share/java/PureWriter
    mv $srcdir/PureWriter/* $pkgdir/usr/share/java/PureWriter
    install -Dm644 purewriter.png "$pkgdir/usr/share/icons/purewriter.png"
    install -Dm644 purewriter.desktop "$pkgdir/usr/share/applications/purewriter.desktop"
}
