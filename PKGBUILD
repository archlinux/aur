# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd-bin"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly. Precompiled binary version"
pkgver=0.1.1
pkgrel=1
arch=('x86_64')
url="https://github.com/ReekyMarko/lqsd"
license=('MIT')
depends=('light')
provides=('lqsd')
conflicts=('lqsd')
source=("${pkgname/-bin/}_${pkgver}_${arch}.tar.zst::https://github.com/ReekyMarko/lqsd/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_${arch}.tar.zst")
sha256sums=('502af7bf2c6637a7097e9e058eaee0679366c6f808f9675105902177e7aa7049')

package() {
	install -D -m755 "${pkgname/-bin/}" "$pkgdir/usr/bin/${pkgname/-bin/}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
}
