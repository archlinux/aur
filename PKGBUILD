# Maintainer: liberodark

pkgname=gitblade
pkgver=0.9.2
pkgrel=1
pkgdesc="An elegant GUI for Git."
arch=('x86_64')
url="https://gitblade.com/"
license=('Custom')
depends=('xdg-utils' 'git')
source_x86_64=("https://gitblade.com/ppa/gitblade_${pkgver}_amd64.deb")
sha512sums_x86_64=('b6648ac22153dabc70672d1a5910017d08358c561d320d96070376449109260e9127287f8a874a5b69ddc53d4c9c09d3fb59f242f31857561aec5292f9c7bebc')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

