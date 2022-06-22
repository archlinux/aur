# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=identia-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Decentralized social media on IPFS"
arch=("x86_64")
url="https://github.com/iohzrd/identia"
license=("AGPL-3.0")
depends=("libappindicator-gtk3" "webkit2gtk")
provides=("go-ipfs" "identia")
conflicts=("go-ipfs" "identia")
source=("https://github.com/iohzrd/identia/releases/download/v${pkgver}/identia_${pkgver}_amd64.deb")
sha256sums=("8c387a00e832bccb3afc1e37e708ac4501f3fbf6d322586eba09e16b26a47b93")

package() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}