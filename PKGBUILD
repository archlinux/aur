# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=actionlint-bin
pkgver=1.6.27
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=(x86_64)
url="https://github.com/rhysd/actionlint"
license=('MIT')

conflicts=('actionlint' 'actionlint-git')
provides=('actionlint')

source=("https://github.com/rhysd/actionlint/releases/download/v${pkgver}/actionlint_${pkgver}_linux_amd64.tar.gz")

sha256sums=('5c9b6e5418f688b7f7c7e3d40c13d9e41b1ca45fb6a2c35788b0580e34b7300f')

package() {
	# package
	install -D -m755 "$srcdir/actionlint" "$pkgdir/usr/bin/actionlint"
}
