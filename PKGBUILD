# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.6.23
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('b39e7cd53f4a317aecfb09edcebcc058df9ebef967866e11aa7f0df27339af3b')

package() {
	# package
	install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
