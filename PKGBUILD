# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
_pkgname="${pkgname%-bin}"
pkgver=2.461.0
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache' 'MIT')
depends=('glibc')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/berty_linux_amd64.tar.gz")
b2sums=('adb8ba6ae0f0c587a3200b27fd5644637b10f4fd0de7ba26c8eb2748a249e9a2abbba7e8700e740cb9610e12670234ace04bfb78a925c4a6444bc9d8db4b078e')

package() {
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE"
	install -Dm0755 "${srcdir}/berty_linux_amd64/berty" "${pkgdir}/usr/bin/berty"
}
