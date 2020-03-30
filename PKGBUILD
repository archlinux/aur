# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=chyle-bin
pkgver=1.9.0
pkgrel=1
provides=('chyle')
pkgdesc="Changelog generator: use a git repository and various data sources and publish the result on external services"
arch=('x86_64')
url='https://github.com/antham/chyle'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/chyle_linux_amd64")
md5sums=('3b07bd456a017f4e23d829594826c920')

package() {
	install -Dm755 "${srcdir}"/chyle* "${pkgdir}/usr/bin/chyle"
}