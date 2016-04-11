# Maintainer: Alexander Keller <git@nycroth.com>
pkgname=bdrss
pkgver=2
pkgrel=2
pkgdesc="Brain Dead RSS"
arch=(any)
url="https://github.com/Nycroth/bdrss"
license=('custom:unlicense')
makedepends=('git')
depends=('python' 'python-feedparser')
source=('git+https://github.com/Nycroth/bdrss.git')
md5sums=('SKIP')

package() {
	cd "${srcdir}/bdrss"

	install -d "${pkgdir}/usr/bin/"
	install -m 755 "bdrss" "${pkgdir}/usr/bin/${pkgname}"
	install -m 755  -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m 755 -d "${pkgdir}/usr/share/man/man1/"
	install -m 644 "bdrss.1" "${pkgdir}/usr/share/man/man1/bdrss.1"
}
