# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.17
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('311e64b5a6556e1a05c44eef6fc170c6e40f66a3d03296413a690e91bc0cba27')
sha256sums_aarch64=('cb03d3f7574d3e252912f48e3d03a6351cba1c4e6481f4dccfed3627609265b6')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
