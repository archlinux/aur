# @Author: Jules <archjules>
# @Date:   2016-07-10T23:16:42+02:00
# @Last modified by:   archjules
# @Last modified time: 2016-07-10T23:57:51+02:00

pkgname='c_g1awrapper-git'
pkgver=1.0
pkgrel=1
pkgdesc='A wrapper for g1a files'
arch=('i686' 'x86_64')

depends=()

source=("git+https://github.com/Kristaba/C-G1A-Wrapper")
md5sums=('SKIP')

build() {
  cd C-G1A-Wrapper
  gcc -o c_g1awrapper c_g1awrapper.c bmp_utils.c -O3
}

package() {
  cd C-G1A-Wrapper
  mkdir -p "$pkgdir/usr/bin"
  cp c_g1awrapper "$pkgdir/usr/bin"
}
