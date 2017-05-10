# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.4.3
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'openssl')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.4.3.pkg.tar.xz')

sha256sums=('6da21fcaf3527d2930eb26e1f36ee0fbc9abe7b5a41bc07126b7ccf609b29fc2')

package() {
	tar xf "${srcdir}/fman-0.4.3.pkg.tar.xz" -C "${pkgdir}"
}