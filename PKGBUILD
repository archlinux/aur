# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.407.1
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/berty/berty"
license=('Apache' 'MIT')
depends=('glibc')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berty/berty/releases/download/v${pkgver}/berty_linux_amd64.tar.gz")
b2sums=('76b2fe8da973f6db188cb0ace6b6a06031a851dee7fe3cf6561a762352ea59e14aeea57c45938c82fa4acb7f14036a751e07c7439d831ae197b1653b28ee9fe1')

package() {
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_linux_amd64/berty" "${pkgdir}/usr/bin/berty"
}
