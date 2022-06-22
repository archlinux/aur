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
sha256sums=("6c95e4acb1792734f00be9806783dd1cb2da243c67844a07ac79a58100261ff9")

package() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}