# Maintainer: Till von Ahnen <till@tillvonahnen.de>
# Maintainer: David Rodriguez <cyanogenmodder@gmail.com>
pkgname=bytecoinwallet
pkgver=1.1.9.2
pkgrel=1
pkgdesc="Bytecoin(BCN) Wallet"
arch=('any')
url="https://bytecoin.org/downloads/"
license=('GPL')
depends=()
source=("https://bytecoin.org/static/files/bytecoinwallet-1.1.9.2.amd64.deb")
md5sums=("ec22826fc5dca156de9ec0b6ce45a262")


build() {
	mkdir ${pkgname}-${pkgver}
	cd ${pkgname}-${pkgver}
	tar xf ../data.tar.gz
}

package() {
	echo "${pkgdir}"
	cd ${pkgname}-${pkgver}
	cp -r usr/ "${pkgdir}"
}
