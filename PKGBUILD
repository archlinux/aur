# Maintainer: Niek den Breeje <n.j.den.breeje@gmail.com>
pkgname=base16-manager
pkgver=1.2.1
pkgrel=1
pkgdesc='A command line tool to install base16 templates and set themes globally.'
arch=('any')
url='https://github.com/base16-manager/base16-manager'
license=('MIT')
depends=('bash' 'git')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('71f2e815cbb5b7511cabe1c6834c05c1')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
