# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.7.9
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('233b280d05e100837f4af1433c7b40a5dcb306e3aa68fb4f17f8a7f45a7df7b4')

package() {
	# package
	install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
