# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd-bin"
progname="lqsd"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly. Precompiled binary version"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://git.reekynet.com/ReekyMarko/lqsd"
license=('MIT')
depends=('light')
provides=('lqsd')
conflicts=('lqsd')
source=("https://gitlab.com/ReekyMarko/lqsd/uploads/19227ed2f2dc8e1acefe559a73d6b54d/lqsd.tar.zst")
sha256sums=('038a4183074f7bc39c52d95489db703098ccbbbef2944d6fe9f4a2ebbabb3d49')

package() {
	install -D -m755 "${progname}" "$pkgdir/usr/bin/${progname}"
}
