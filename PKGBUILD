# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.1
pkgrel=1
pkgdesc='Synchronise your pacman packages with a file'
arch=('any')
url="https://github.com/ca-cl2/${pkgname}"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e81250f6b65bc0f74f5c966f6804442c9b12bc4d49467dfae9878437e0c5c57')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm755 "${pkgname}-${pkgver}/$pkgname.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
