# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ramfetch-git
_pkgname=ramfetch
pkgver=1.0.0.a1d4d40
pkgrel=1
pkgdesc="A fetch which displays memory info using /proc/meminfo"
arch=('x86_64')
url="https://github.com/gentoo-btw/$_pkgname"
license=('MIT')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd $_pkgname
  install -Dm755 ramfetch "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
