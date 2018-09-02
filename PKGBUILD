# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=unitypack-git
pkgver=0
pkgrel=1
pkgdesc="Python deserialization library for Unity3D Asset format"
url="https://github.com/HearthSim/UnityPack"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('python' 'python-lz4')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/HearthSim/UnityPack.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
}

build() {
  cd ${pkgname}
}

package() {
  cd ${pkgname}
  #make DESTDIR="$pkgdir/" install
  #install -DTm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
