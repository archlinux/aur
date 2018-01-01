#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.1.3
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
sha256sums=('b7982986992190ae50ab2feb310cb003a2ec9c5dcba19aa8b1ebb0d120e8686f')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
