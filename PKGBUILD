# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.434.7
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('glibc')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_linux_amd64.tar.gz")
b2sums=('5786f8a5d41a1beee991c3d47f04be6b7386ab4243726b3788603ef39d00a7d59e5cb64e8b4005af9816e8b65c45b8048d5ffb3108d045fd198824e5a9c3f67e')

package() {
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_linux_amd64/berty" "${pkgdir}/usr/bin/berty"
}
