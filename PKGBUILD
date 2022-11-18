# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.3.3
pkgrel=1
pkgdesc='Automatically synchronise your packages with a file'
arch=('any')
url="https://github.com/ca-cl2/${pkgname}"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fd57e6b5902731ff7849b91af05aff1d28a5d62b6213523b5e30bc7ef758b1b')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}/$pkgname.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
