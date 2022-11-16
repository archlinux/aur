# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.3
pkgrel=1
pkgdesc='Synchronise your packages with a file'
arch=('any')
url="https://github.com/ca-cl2/${pkgname}"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d08b7579fb4b44dc3547e9df026ca46c3ed8e889374b2bc4a59277e7c98c8417')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}/$pkgname.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
