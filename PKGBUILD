# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd-bin"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly. Precompiled binary version"
pkgver=0.1.1
pkgrel=2
arch=('x86_64')
url="https://git.reekynet.com/ReekyMarko/lqsd"
license=('MIT')
depends=('light')
provides=('lqsd')
conflicts=('lqsd')
source=("https://github.com/ReekyMarko/lqsd/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_${arch}.tar.zst")
sha256sums=('053d6080bba0c762ce9902345e87a4f1d1ae2109d767e1adff2646a333d72529')

package() {
	install -D -m755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
}
