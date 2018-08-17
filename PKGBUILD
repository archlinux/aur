# Maintainer: liberodark

pkgname=gitblade
pkgver=0.9.1
pkgrel=1
pkgdesc="An elegant GUI for Git."
arch=('x86_64')
url="https://gitblade.com/"
license=('Custom')
depends=('xdg-utils' 'git')
source_x86_64=("https://gitblade.com/ppa/gitblade_${pkgver}_amd64.deb")
sha512sums_x86_64=('697c7a94d9d538164894d65aafbeb7c7474423149ef7da358f6fc0bdb0ee98bc947cbe2ba92b23a874627a8eea8b9de405434a25c7706502116b3269f4e1a2ce')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

