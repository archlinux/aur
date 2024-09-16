# Maintainer: Abdurrahim YILMAZ <mail@ayilmaz.xyz>

pkgname=cuniq
pkgver=1.0.3
pkgrel=1
pkgdesc="Command line tool that counts unique lines FAST"
provides=('cuniq')
arch=(x86_64)
url="https://github.com/zkxs/cuniq"
license=('GPL-3.0-or-later')
conflicts=()
source=("cuniq-$pkgver::https://github.com/zkxs/cuniq/releases/download/$pkgver/cuniq-linux")
sha256sums=('f55acb38b7cd4626cd49ce0220c53818cc9d011cf6657f77dd239fb202bb1d87')

package() {
	install -Dm755 $srcdir/cuniq-$pkgver "${pkgdir}/usr/bin/cuniq"
}
