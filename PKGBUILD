# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=dot-tools
pkgver=0.1
pkgrel=1
pkgdesc='Tools for distributed dotfiles'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('MIT')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd $pkgname &&
  DESTDIR="$pkgdir" make prefix=/usr install
}
