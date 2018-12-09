#
# Maintainer: dev@2ion.de
#
pkgname=packer-io-bin
pkgver=1.3.3
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
sha256sums=('efa311336db17c0709d5069509c34c35f0d59c63dfb05f61d4572c5a26b563ea')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
