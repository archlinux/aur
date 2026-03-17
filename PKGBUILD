# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.12
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('f143868766a7d11be0a1227e3a6be439ffdb29c59ed71ca6bc6cb13867915546')
sha256sums_aarch64=('903c70b842ba5fbfdfa3cc5bad9555f09bb69cd09a1f0f97382762c0260abb99')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
