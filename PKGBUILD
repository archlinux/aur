#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.2.2
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
sha256sums=('6575f8357a03ecad7997151234b1b9f09c7a5cf91c194b23a461ee279d68c6a8')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
