# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("https://github.com/luccadibe/benchctl/releases/download/v$pkgver/benchctl_Linux_x86_64.tar.gz")
sha256sums=('3ae2b46b432b72cbd2a61f9bc0428577b787b36d01c392ed34d71b6b0a4500c5')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
