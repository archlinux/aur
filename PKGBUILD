# Maintainer: Dustin Childers <dchilders@gmail.com>
pkgname=berty-bin
pkgver=2.251.2
pkgrel=1
pkgdesc="Berty is a secure peer-to-peer messaging app that works with or without internet access, cellular data or trust in the network"
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty-bin')
conflicts=('berty-bin')
source=(https://github.com/berty/berty/releases/download/v${pkgver}/berty_Linux_x86_64.tar.gz)
sha256sums=(d2e19f978035d74b05787d232b52fdbac33358f1405b8d6a107214c3c3d203da)

package() {
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_Linux_x86_64/berty" "${pkgdir}/usr/bin/berty"
}
