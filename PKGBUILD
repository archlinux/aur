# Maintainer: liberodark

pkgname=shots
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple, minimalistic, and task-focused application for creating screenshots."
arch=('x86_64')
url="https://github.com/binjospookie/--shots"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/binjospookie/--shots/releases/download/v1.2.0/shots_1.2.0_amd64.deb")
sha512sums_x86_64=('15e7d9fa6fa00fdf4cc3bc265e8a277e277341eaff800e1357b88b1b40a3d23d4e88abf88896e04ad81cddcebcf6ef37c847f0eb7a98f1860f8f25659db90d04')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  cp -r opt $pkgdir
}

