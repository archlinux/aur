# Maintainer: replicadse <haw@voidpointergroup.com>
pkgname=senile
pkgver=0.1.18
pkgrel=1
epoch=
pkgdesc='collecting ToDo statements from files/directories as JSON format'
arch=('x86_64')
url='https://github.com/replicadse/senile'
license=('MIT')
makedepends=(
  'rust'
  'rustup'
  'cargo'
)
provides=('senile')

package() {
  cargo +stable install $pkgname --version=$pkgver --root="$pkgdir/usr" --no-track --all-features
}

