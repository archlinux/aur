# Maintainer: Kenneth G. Strawn <kstrawn0@saddleback.edu>

pkgname=triggerlinux-archiso
_pkgname="TriggerLinux"
pkgrel=1
pkgdesc="TriggerLinux build scripts"
arch=("x86_64")
url="https://github.com/realKennyStrawn93/$_pkgname"
pkgver=$(date +%Y.%m.%d.$(git ls-remote $url | head -n1 | cut -c-40))
license=("GPL")
depends=("bash")
source=("git+$url.git#branch=master")
md5sums=("SKIP")

package() {
  mkdir -p $pkgdir/opt
  cd $srcdir
  cp -r $_pkgname $pkgdir/opt/triggerlinux-archiso
}
