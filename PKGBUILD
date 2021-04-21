# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: HackMe <hackme.any@protonmail.com>
pkgname=st-hackme
pkgver=1.0.0
pkgrel=1
pkgdesc="This is my build of ST"
arch=(x86_64)
url="https://github.com/HackMEAny/simple_terminal.git"
license=('MIT')
depends=()
makedepends=(git make)
checkdepends=()
optdepends=()
provides=(st)
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "simple_terminal"
	make DESTDIR="$pkgdir/" install
}
