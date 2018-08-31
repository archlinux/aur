#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.2.5
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
sha256sums=('bc58aa3f3db380b76776e35f69662b49f3cf15cf80420fc81a15ce971430824c')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
