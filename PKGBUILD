# Maintainer: liberodark

pkgname=gitblade
pkgver=0.9.4
pkgrel=1
pkgdesc="An elegant GUI for Git."
arch=('x86_64')
url="https://gitblade.com/"
license=('Custom')
depends=('xdg-utils' 'git')
source_x86_64=("https://gitblade.com/ppa/gitblade_${pkgver}_amd64.deb")
sha512sums_x86_64=('f64b05cd0e21d30dc5cc0042d7e7618fdd960ef3cf1832f61cff0e0697945d08d5ddb14132a0d9565b3d80e1e90b70d8ee8f3507f847d1ca0839c8093259bd03')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

