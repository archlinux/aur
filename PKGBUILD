# Maintainer: Alexander Keller <contact@nycroth.com>
pkgname=bdrss
pkgver='2.1'
pkgrel='1'
pkgdesc='Brain Dead RSS'
arch=('any')
url="https://github.com/Nycroth/${pkgname}"
license=('MIT')
makedepends=('git')
depends=('python' 'python-feedparser')
source=("git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
	cd "${srcdir}/bdrss"

	install -d "${pkgdir}/usr/bin/"
	install -m 755 "bdrss" "${pkgdir}/usr/bin/${pkgname}"
	install -m 755 -d "${pkgdir}/usr/share/man/man1/"
	install -m 644 "bdrss.1" "${pkgdir}/usr/share/man/man1/bdrss.1"
}
