# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.7.10
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('f4c76b71db5755a713e6055cbb0857ed07e103e028bda117817660ebadb4386f')

package() {
  # package
  install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
