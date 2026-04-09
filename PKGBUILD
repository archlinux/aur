# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.21
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('a4ccdbbf4b852e3054f5d146d0e0604bf703c7d0ffb6369ffa4aeee070c0e1da')
sha256sums_aarch64=('5b01d58a811a20a4a45622950242ba4d64358dbb0b2689ddb52e6ad1f3f35c4b')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
