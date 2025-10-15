# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("https://github.com/luccadibe/benchctl/releases/download/v0.1.3/benchctl_Linux_x86_64.tar.gz")
sha256sums=('e71840239a6723cab12f5d4c48b1ff4a24538dad3e05066e902b492948eac80b')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
