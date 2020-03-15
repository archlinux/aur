# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gitql-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A git query language'
arch=('x86_64')
url="https://github.com/cloudson/gitql"
license=('MIT')
provides=('gitql')
source=("https://github.com/cloudson/gitql/releases/download/${pkgver}/gitql-linux64.zip")
md5sums=('39edfd614f50b56724b00b7d94e3d9a5')

package() {
	cd "${srcdir}/gitql-linux64"
	install -Dm755 gitql "${pkgdir}/usr/bin/gitql"
}
# vim:set ts=2 sw=2 et: