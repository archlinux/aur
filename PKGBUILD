# Maintainer: p3nguin-kun <p3nguinkun@proton.me>
pkgname=lmaofetch
pkgver=2.2
pkgrel=1
pkgdesc="A simple system fetch written in Bash"
arch=('any')
url="https://github.com/p3nguin-kun/lmaofetch"
license=('MIT')
depends=('bash')
makedepends=('git')
#install=
source=("$pkgname::git+https://github.com/p3nguin-kun/lmaofetch#tag=${pkgver}")
noextract=()
sha512sums=('SKIP')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/lmaofetch/LICENSE"
}
