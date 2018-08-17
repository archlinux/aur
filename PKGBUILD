# Maintainer: liberodark

pkgname=gitblade
pkgver=0.9.0
pkgrel=1
pkgdesc="An elegant GUI for Git."
arch=('x86_64')
url="https://gitblade.com/"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://gitblade.com/ppa/gitblade_${pkgver}_amd64.deb")
sha512sums_x86_64=('950e96d8256b93792eaa1c099378c44c0bb4609a9686bb0805536a465cb1e873caa098ed143c6b413510e71b4609a2450d61a3fb0bfa33928c30e06df95c62c3')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

