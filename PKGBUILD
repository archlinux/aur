# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv
pkgver=0.13.0
pkgrel=2
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions"
url="https://github.com/aegoroff/solv"
license=('MIT')

build() {
	return 0
}

package() {
	conflicts=("solv-bin")

	cargo install --no-track --root "$pkgdir/usr/" solv
}
