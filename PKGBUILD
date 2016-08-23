pkgdesc="systemd-nspawn tool"
pkgname=nspawn.sh
pkgver=1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/random-archer/nspawn.sh"
#source=("git+${url}.git#tag=v$pkgver")
source=("git+${url}.git#branch=master")
md5sums=('SKIP')
license=('Apache')

package() {
  cd "$pkgname"
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
