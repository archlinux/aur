# Maintainer: @RubenKelevra
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.302.8
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('libglvnd')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_Linux_x86_64.tar.gz")
sha256sums=('b8a53a7b6c1480028001978d64afb9bfb8df1a67b89dec4741133feb78157184')
b2sums=('1c90f4137ba291d8bf8b657b7902990bcee50ba045ae7d634b042af9aa19b316984080e5e968ab554d8c4d388fbc9a95364b2126365b4c4cb08b93d19be491c8')

package() {
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_Linux_x86_64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_Linux_x86_64/berty" "${pkgdir}/usr/bin/berty"
}
