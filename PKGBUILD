pkgdesc="Bash container engine for systemd-nspawn"
pkgname=nspawn.sh
pkgver=master
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/random-archer/nspawn.sh"
#source=("git+${url}.git#tag=v$pkgver")
source=("git+${url}.git#branch=master")
md5sums=('SKIP')
license=('Apache')
makedepends=('git')

package() {
  cd "$pkgname"
  install -D -m755 nspawn.sh "$pkgdir/usr/bin/nspawn.sh"
}
