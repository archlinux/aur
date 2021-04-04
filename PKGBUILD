# Maintainer: @RubenKelevra
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.270.2
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_Linux_x86_64.tar.gz")
sha256sums=('db241d617c72fa3bfcdb9fa39f7c982ac625b0d96c6c7cd2051e510bee9b8e61')

package() {
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_Linux_x86_64/berty" "${pkgdir}/usr/bin/berty"
}
