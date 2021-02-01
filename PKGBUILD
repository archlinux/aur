# Maintainer: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.254.0
pkgrel=1
pkgdesc="Berty is a secure peer-to-peer messaging app that works with or without internet access, cellular data or trust in the network"
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-bin')
conflicts=('berty-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_Linux_x86_64.tar.gz")
sha256sums=('b3a8630f44e522a1959f9252e68524a0bdd062ed9c9f761f2557d504dc938046')

package() {
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_Linux_x86_64/berty" "${pkgdir}/usr/bin/berty"
}
