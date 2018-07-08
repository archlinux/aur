## Package Maintainer: Karl-K

pkgname=checkip
pkgver=1.0
pkgrel=1
pkgdesc="A simple curl one-liner"
arch=('any')
license=('MIT/X')
url="https://github.com/karl-k/checkip"
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('204765d3cd08dcf19b46ba42c849c255514847b7a4d62608f337adbb49a29e445545421c80f25721fde0519725426723634242fb2340e700ee0e1cd450f60273')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

mkdir -p "${pkgdir}/usr/bin/"
install -D -m755 "checkip" "${pkgdir}/usr/bin/"
}
