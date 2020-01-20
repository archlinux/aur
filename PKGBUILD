# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd-bin"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly. Precompiled binary version"
pkgver=0.1.0
pkgrel=2
arch=('x86_64')
url="https://git.reekynet.com/ReekyMarko/lqsd"
license=('MIT')
depends=('light')
provides=('lqsd')
conflicts=('lqsd')
source=("https://gitlab.com/ReekyMarko/lqsd/uploads/8d363a1933e932e1a55a408b5f203537/lqsd_0.1.0_x86_64.tar.zst")
sha256sums=('038a4183074f7bc39c52d95489db703098ccbbbef2944d6fe9f4a2ebbabb3d49')

package() {
	install -D -m755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}-bin}"
}
