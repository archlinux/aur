# Maintainer: Niek den Breeje <n.j.den.breeje@gmail.com>
pkgname=base16-manager
pkgver=1.1.0
pkgrel=1
pkgdesc='A command line tool to install base16 templates and set themes globally.'
arch=('any')
url='https://github.com/AuditeMarlow/base16-manager'
license=('MIT')
depends=('bash' 'git')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('015a729f5f59d45f3d1d6ed5fdfe6c91')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
