# Maintainer: p3nguin-kun <p3nguinkun@proton.me>
pkgname=lmaofetch
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="A simple system fetch written in Bash"
arch=('any')
url="https://github.com/p3nguin-kun/lmaofetch"
license=('MIT')
depends=('bash' 'ttf-nerd-fonts-symbols')
makedepends=('git')
#install=
changelog=
source=("$pkgname::git+https://github.com/p3nguin-kun/lmaofetch#tag=${pkgver}")
noextract=()
sha512sums=('SKIP')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/lmaofetch/LICENSE"
}
