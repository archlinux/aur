# Maintainer: Gustavo Chain <gchain@gmail.com>
pkgname=httplab
pkgver=0.3.0
pkgrel=1
pkgdesc="An interactive web server"
arch=(x86_64)
url="http://github.com/gchaincl/httplab"
license=('MIT')
makedepends=('wget')
provides=('httplab=$pkgver')
conflicts=('httplab')
replaces=('httplab')
install=
source=("$pkgname"::"https://github.com/gchaincl/httplab/releases/download/v${pkgver}/httplab_linux_amd64")
md5sums=(
	'e8b66d189b9d98bcd106318799ab5dfa'
)

package() {
	install -D -s -m755 "httplab" "${pkgdir}/usr/bin/${pkgname}"
}
