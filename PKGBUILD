# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=quick-skeleton-bin
pkgver=0.4.7
pkgrel=1
pkgdesc='Simple tool for scaffolding'
arch=('x86_64')
url="https://github.com/arthrp/quick-skeleton"
license=('GPL-3.0')
provides=('quick-skeleton')
source=("${url}/releases/download/v${pkgver}/quick-skeleton")
md5sums=('e1e83547767b6228ecf6dbd4a042ac81')

package() {
	install -Dm755 "${srcdir}"/quick-skeleton "${pkgdir}/usr/bin/quick-skeleton"
}
# vim:set ts=2 sw=2 et: