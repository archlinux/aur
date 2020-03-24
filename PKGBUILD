# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flog-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='A fake log generator for common log formats'
arch=('x86_64')
url="https://github.com/mingrammer/flog"
license=('MIT')
provides=('flog')
source=("${url}/releases/download/v${pkgver}/flog_${pkgver}_linux_amd64.tar.gz")
md5sums=('cdae17f3e65811ebfd69831ff2d99014')

package() {
	cd "${srcdir}"
	install -Dm755 flog "${pkgdir}/usr/bin/flog"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/flog/LICENSE"
}
# vim:set ts=2 sw=2 et: