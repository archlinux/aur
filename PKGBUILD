# Maintainer: Lucca Dibe <luccadibe@users.noreply.github.com>
pkgname=benchctl-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A CLI framework for orchestrating benchmarks across distributed or local setups"
arch=('x86_64')
url="https://github.com/luccadibe/benchctl"
license=('MIT')
depends=('python>=3.10')
optdepends=('uv: for seaborn plotting engine')
source=("benchctl-${pkgver}_Linux_x86_64.tar.gz::https://github.com/luccadibe/benchctl/releases/download/v0.3.2/benchctl_Linux_x86_64.tar.gz")
sha256sums=('b1661040b5aa99d9bf6f605f0211f768d43fb8665348db98b9bea27444417822')

package() {
  install -Dm755 "$srcdir/benchctl" "$pkgdir/usr/bin/benchctl"
}
