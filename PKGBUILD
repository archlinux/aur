# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('cf2f8172b747575f90c6072056df7c3973498c6b4f43b7c8f2c47e00097a2796')
sha256sums_aarch64=('f5578baa4ef5340a91c12bbf1a38d9cc45357fea155a738d78e396823060ee1e')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
