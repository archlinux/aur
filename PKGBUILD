# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=boilr-bin
pkgver=0.3.0
pkgrel=2
pkgdesc='Boilerplate template manager that generates files or directories from template repositories '
arch=('x86_64')
url="https://github.com/tmrts/boilr"
license=('Apache-2.0')
provides=('boilr')
source=("${url}/releases/download/${pkgver}/boilr-${pkgver}-linux_amd64.tgz")
md5sums=('00bc3e24b5631870cfe1a700de0092df')

package() {
	install -Dm755 "${srcdir}"/boilr "${pkgdir}/usr/bin/boilr"
}
# vim:set ts=2 sw=2 et: