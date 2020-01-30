# Maintainer: ThiBsc <thibsc at tutanota dot com>
pkgname=stopwatchcpp
_gitname=stopwatch
_binaryname=sw
pkgver=v1
pkgrel=1
pkgdesc="A command line stopwatch"
arch=('any')
url="https://github.com/thibsc/stopwatch"
license=('MIT')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
	cd ${srcdir}/${_gitname}
	make
}

package() {
	install -Dm755 ${srcdir}/${_gitname}/bin/${_binaryname} ${pkgdir}/usr/bin/${_binaryname}
}

