# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.6.10
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('b653303ea708e5c53056bd67541dab781a62200e9338f5568cc7b66851d6e56a')

package() {
	# package
	install -D -m755 $srcdir/actionlint $pkgdir/usr/bin/actionlint
}
