# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-bin
pkgver=1.13
pkgrel=1
pkgdesc='HTTP-server to execute shell commands'
arch=('x86_64')
url="https://github.com/msoap/shell2http"
license=('MIT')
provides=('shell2http')
source=("https://github.com/msoap/shell2http/releases/download/${pkgver}/shell2http-${pkgver}.linux.amd64.tar.gz")
md5sums=('52a2274082ad504c9d0204dfd08d2324')

package() {
	install -Dm755 "${srcdir}"/shell2http "${pkgdir}/usr/bin/shell2http"
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/shell2http/LICENSE"
}
# vim:set ts=2 sw=2 et: