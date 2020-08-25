# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=commitizen-go
pkgver=1.0.0
pkgrel=2
pkgdesc="Command line utility to standardize git commit messages, golang version"
arch=(x86_64)
url="https://github.com/lintingzhen/commitizen-go"
license=('GPL')
makedepends=(git go automake)
source=("https://github.com/lintingzhen/commitizen-go/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    sudo make install
}
md5sums=('b35e8fa0b64b253ee627a4b5fd67b8e0')
