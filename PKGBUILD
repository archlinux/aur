# Maintainer: Till von Ahnen <till@tillvonahnen.de>
# Maintainer: David Rodriguez <openlydeveloped@gmail.com>
pkgname=bytecoinwallet
pkgver=1.1.9.3
pkgrel=1
pkgdesc="Bytecoin(BCN) Wallet"
arch=('any')
url="https://bytecoin.org/downloads/"
license=('GPL')
depends=()
source=("https://bytecoin.org/storage/wallets/bytecoin_wallet/bytecoinwallet-1.1.9.3.amd64.deb")
md5sums=("e94f6248e25c08847d352f12339d03ba")


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
