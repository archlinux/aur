# Maintainer: Till von Ahnen <till@tillvonahnen.de>
pkgname=bytecoinwallet
pkgver=1.1.4
pkgrel=1
pkgdesc="Bytecoin(BCN) Wallet"
arch=('any')
url="https://bytecoin.org/downloads/"
license=('GPL')
depends=()
source=("https://bytecoin.org/static/files/BytecoinWallet-1.1.4.amd64.deb")
md5sums=("f5669271aa3c12be433bdfa7e3a11d5b")


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
