# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.6.12
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('9a7ea97e07a2c058756609274126e78b60ed15c1ed481ccb9da94b74c24d5f3f')

package() {
	# package
	install -D -m755 $srcdir/actionlint $pkgdir/usr/bin/actionlint
}
