#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.1.2
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
sha256sums=('7e315a6110333d9d4269ac2ec5c68e663d82a4575d3e853996a976875612724b')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
