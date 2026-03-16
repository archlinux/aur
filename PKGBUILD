# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.10
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('0d925d460bff996b47eab2ffd697770561eaf86c2af245452e4071407fad6f32')
sha256sums_aarch64=('e13ced46eb27056f6bfd708b1982fbea3ddaafd83b563ac06435b3b13ff7cb31')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
