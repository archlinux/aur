# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: dev@2ion.de

pkgname=packer-io-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="Create identical machine images for multiple platforms from a single source configuration (binary build)"
arch=('x86_64')
url="https://www.packer.io/downloads.html"
license=('MPL')
depends=('glibc')
provides=('packer-io')
conflicts=('packer-io')
replaces=('packer-io')
source=("https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip")
sha256sums=('2e3ea8f366d676d6572ead7e0c773158dfea0aed9c6a740c669d447bcb48d65f')

package() {
	install -Dm755 packer "$pkgdir"/usr/bin/packer-io
}
