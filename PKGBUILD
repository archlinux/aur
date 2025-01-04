# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.7.6
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('5d1a70d9de15fee5371e6f9e20cc29b284e814d6ee1b882f9749e91caf716eba')

package() {
	# package
	install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
