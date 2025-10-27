# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("https://github.com/luccadibe/benchctl/releases/download/v0.1.5/benchctl_Linux_x86_64.tar.gz")
sha256sums=('b20632a5bd7240b8a87f346a8fcdc47dd5331e239454423d037bc174973cec54')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
