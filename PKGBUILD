# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.6
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('3c40d0f5ff1e23d58f46b34101f3c32fac89485e00cf7d48f12676367590ba99')
sha256sums_aarch64=('4549d7a6d93884015ca2259c08e51b5d483a4765ca9738e76c2242e545282f56')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
