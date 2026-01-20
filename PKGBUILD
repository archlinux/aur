# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("https://github.com/luccadibe/benchctl/releases/download/v0.2.1/benchctl_Linux_x86_64.tar.gz")
sha256sums=('2ca94d301e89fffd408ddd18d1f1f9da08799909bd24088362cf482e6e358f33')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
