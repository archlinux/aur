# Maintainer: @RubenKelevra
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.372.5
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_linux_amd64.tar.gz")
sha256sums=('99d34401980c6b4ccd9c3c99fb728f79549259a7bbbe8744e7a097e3d6717c29')
b2sums=('a560622b41da36ba71949c1253d330671adb08fba9510ee75ecfeee445daf7cd1f3fe921c11f94c32c056d28803c9999383186b5bd0abc4153c104db2932f5bf')

package() {
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_linux_amd64/berty" "${pkgdir}/usr/bin/berty"
}
