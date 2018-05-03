#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Hashicorp Packer -- upstream binary build"
arch=('x86_64')
url="https://www.packer.io/downloads.html"
license=('MPL')
depends=('glibc')
provides=('packer-io')
conflicts=('packer-io')
replaces=('packer-io')
source=("https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip")
sha256sums=('822fe76c2dfe699f187ef8c44537d10453a1545db620e40b345cf6991a690f7d')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
