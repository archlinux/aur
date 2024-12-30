# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.7.5
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('3e6e0a832dfa0b5f027e6b8956aad2632d69b7cb778b1cff847b40279950a856')

package() {
  # package
  install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
