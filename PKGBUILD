pkgname=ken-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A sharp AUR/Pacman helper. Pre-compiled binary version."
arch=('x86_64')
url="https://github.com/nespaset/ken"
license=('Apache')
depends=('pacman' 'git')
provides=('ken' 'kn')
conflicts=('ken' 'ken-git' 'sake-git' 'sk')
source=("ken::${url}/releases/download/v${pkgver}/ken")
sha256sums=('7c85f48939c7911b361abcc24fdc32108eb32f802a65c523a6ba71f870d4a261')

package() {
  install -Dm755 "$srcdir/ken" "$pkgdir/usr/bin/ken"
  ln -sf /usr/bin/ken "$pkgdir/usr/bin/kn"
}
