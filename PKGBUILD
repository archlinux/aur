pkgname=ken-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A sharp AUR/Pacman helper. Pre-compiled binary version."
arch=('x86_64')
url="https://github.com/nespaset/ken"
license=('Apache')
depends=('pacman' 'git')
provides=('ken' 'kn' 'sk')
conflicts=('ken' 'ken-git' 'sake-git' 'sk')
source=("ken::${url}/releases/download/v${pkgver}/ken")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/ken" "$pkgdir/usr/bin/ken"
  ln -sf /usr/bin/ken "$pkgdir/usr/bin/kn"
}
