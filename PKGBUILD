# Maintainer: Parsarch <parsarch@riseup.net>
pkgname=ir-parsarch-git
_gitname=ir-parsarch
pkgver=10.cac341e
pkgrel=1
pkgdesc="Persian layout created by Parsarch"
url="https://github.com/parsarch"
arch=('any')
license=('unknown')
depends=()
source=("git://github.com/parsarch/ir-parsarch.git")
sha256sums=('SKIP')

pkgver() {
	cd $_gitname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${_gitname}/Xorg/
  install -Dm644 ir-parsarch  ${pkgdir}/usr/share/X11/xkb/symbols/ir-parsarch
}

