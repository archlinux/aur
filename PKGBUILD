# Maintainer: Pidchenko Matvii <pidchenkomatvii@gmail.com>
pkgname=pacfish
pkgver=1.0.5
pkgrel=1
pkgdesc="Lightweight AUR helper written in Ruby, following the KISS principles."
arch=('any')
url="https://codeberg.org/Ryba37/pacfish"
license=('GPL3')
depends=('ruby' 'pacman' 'ruby-colorize')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 main.rb "$pkgdir/usr/bin/pacfish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

