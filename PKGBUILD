# Maintainer: Niek den Breeje <n.j.den.breeje@gmail.com>
pkgname=base16-manager
pkgver=1.0.0
pkgrel=2
pkgdesc='A command line tool to install base16 templates and set themes globally.'
arch=('any')
url='https://github.com/AuditeMarlow/base16-manager'
license=('MIT')
depends=('bash' 'git')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('2898be2310016b053259d7a1e95e59d2')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
