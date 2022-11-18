# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.3.2
pkgrel=1
pkgdesc='Synchronise your packages with a file'
arch=('any')
url="https://github.com/ca-cl2/${pkgname}"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7fa7dc38ba2a6c6918f43cd7d19923f56d9313d12ebad3e76f1cbf40f42bb0f')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}/$pkgname.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
