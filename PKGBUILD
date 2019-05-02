# Maintainer: liberodark

pkgname=gitblade-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="An elegant GUI for Git."
arch=('x86_64')
url="https://gitblade.com/"
license=('Custom')
depends=('xdg-utils' 'git')
source_x86_64=("https://gitblade.com/ppa/gitblade_${pkgver}_amd64.deb")
sha512sums_x86_64=('d411e706f6e0845838e8078251ab6b67613bd0dcd9060db24d49ec7ba15ef5ba191faa42cd710552c7132be50f94eba97d6732a31565a6ab8543066cde1a3055')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

