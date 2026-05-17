# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('0a9f6a8f67f525e48cd060f9851bfc59e7dbfdbc14bf4853fbafc075b46fcaed')
sha256sums_aarch64=('b82e747838bf0b8fc109d5fc9c04a7930cb9e331d108f505c445ebfbec51212f')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
