# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fac-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Easy-to-use CUI for fixing git conflicts'
arch=('x86_64')
url="https://github.com/mkchoi212/fac"
license=('MIT')
provides=('fac')
source=("https://github.com/mkchoi212/fac/releases/download/v${pkgver}/fac_${pkgver}_linux_amd64.tar.gz")
md5sums=('cd1d0959d3276bb86c776658f005c551')

package() {
	cd "${srcdir}"
	install -Dm755 fac "${pkgdir}/usr/bin/fac"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fac/LICENSE"
}
# vim:set ts=2 sw=2 et: