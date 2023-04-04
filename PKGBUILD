# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.6.24
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('3c5818744143a5d6754edd3dcc4c2b32c9dfcdd3bb30e0e108fb5e5c505262d4')

package() {
	# package
	install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
