# Maintainer: Gustavo Chain <gchain@gmail.com>
pkgname=httplab
pkgver=0.4.0
pkgrel=1
pkgdesc="The interactive web server"
arch=(x86_64)
url="http://github.com/gchaincl/httplab"
license=('MIT')
makedepends=('wget' 'tar' 'gzip')
provides=('httplab')
conflicts=('httplab')
replaces=('httplab')
install=
source=("$pkgname"::"https://github.com/gchaincl/httplab/releases/download/v${pkgver}/httplab_${pkgver}_linux_amd64.tar.gz")
md5sums=(
	'0b00487b6d52c67713170dc3fa868a08'
)

package() {
	install -D -s -m755 "httplab" "${pkgdir}/usr/bin/${pkgname}"
}
