# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('f13986f5fb0ebe2bdd4c105ea79138fb7804080df11346c44805300d86c9e300')
sha256sums_aarch64=('195674164f87c21c2627be9eb7e544b766989886a6a6c8f9fde72883786e4d88')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
