# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=commitizen-go
pkgver=0.1.0
pkgrel=1
pkgdesc="Command line utility to standardize git commit messages, golang version"
arch=(x86_64)
url="https://github.com/lintingzhen/commitizen-go"
license=('GPL')
makedepends=(git go)
source=("https://github.com/lintingzhen/commitizen-go/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make install
}
md5sums=('89331e0516895e467bc49a1a17e8bb0a')
