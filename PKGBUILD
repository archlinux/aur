# Maintainer: Justin Yao Du <justinyaodu@gmail.com>
pkgname='iscanimage'
pkgver='1.1.0'
pkgrel=1
pkgdesc="User-friendly command line program for operating scanner devices."
arch=('any')
url="https://github.com/justinyaodu/${pkgname}"
license=('MIT')
depends=('bash' 'sane')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/justinyaodu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
