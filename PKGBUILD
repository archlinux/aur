# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("https://github.com/luccadibe/benchctl/releases/download/v$pkgver/benchctl_Linux_x86_64.tar.gz")
sha256sums=('9ddd90a1ec6841e8accb01ddbb041ba9158657813effff23f9cf39b30034533b')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
