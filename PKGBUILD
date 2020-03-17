# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vg-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Virtualgo: Easy and powerful workspace based development for go'
arch=('x86_64')
url="https://github.com/GetStream/vg"
license=('MIT')
provides=('vg')
source=("${url}/releases/download/v${pkgver}/vg-linux-amd64")
md5sums=('dc968a20d16aca3de752a217e97094a2')

package() {
	cd "${srcdir}"
	install -Dm755 vg-* "${pkgdir}/usr/bin/vg"
}
# vim:set ts=2 sw=2 et: