# Maintainer: Alexander Keller <contact@nycroth.com>
pkgname=bdrss
pkgver='3'
pkgrel='1'
pkgdesc='Brain Dead RSS'
arch=('any')
url="https://github.com/Nycroth/${pkgname}"
license=('MIT')
makedepends=('git')
depends=('python' 'python-feedparser')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('2a91d7b8f81e2441b7ef1db1258f2313')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -d "${pkgdir}/usr/bin/"
	install -m 755 "bdrss" "${pkgdir}/usr/bin/${pkgname}"
	install -m 755 -d "${pkgdir}/usr/share/man/man1/"
	install -m 644 "bdrss.1" "${pkgdir}/usr/share/man/man1/bdrss.1"
}
